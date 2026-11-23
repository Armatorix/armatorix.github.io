package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"text/template"

	"rsc.io/qr"
)

type Personal struct {
	Name  string `json:"name"`
	Title string `json:"title"`
	// Tagline is the one-sentence introduction under the name on the website.
	Tagline     string `json:"tagline"`
	Location    string `json:"location"`
	Email       string `json:"email"`
	Phone       string `json:"phone"`
	Website     string `json:"website"`
	Degree      string `json:"degree"`
	Freelance   string `json:"freelance"`
	Description string `json:"description"`
	Focus       string `json:"focus"`
}

type Social struct {
	Name       string `json:"name"`
	URL        string `json:"url"`
	Icon       string `json:"icon"`
	IconImage  string `json:"iconImage"`
	IconHeight string `json:"iconHeight"`
	IconStyle  string `json:"iconStyle"`
	Title      string `json:"title"`
	Username   string `json:"username"`
}

// Role is one of the "What I do" cards on the website.
type Role struct {
	Icon  string `json:"icon"`
	Title string `json:"title"`
	Since string `json:"since"`
	Text  string `json:"text"`
}

type Interest struct {
	Name string `json:"name"`
	Icon string `json:"icon"`
	URL  string `json:"url,omitempty"`
}

type Language struct {
	Name  string `json:"name"`
	Level string `json:"level"`
}

type Thesis struct {
	Topic        string   `json:"topic"`
	Technologies []string `json:"technologies"`
	Description  string   `json:"description"`
}

type Education struct {
	Institution string  `json:"institution"`
	Degree      string  `json:"degree"`
	Faculty     string  `json:"faculty"`
	Period      string  `json:"period"`
	Thesis      *Thesis `json:"thesis,omitempty"`
}

type ExperienceProject struct {
	Name             string   `json:"name"`
	URL              string   `json:"url,omitempty"`
	Technologies     []string `json:"technologies"`
	Responsibilities []string `json:"responsibilities"`
	Databases        []string `json:"databases,omitempty"`
	Cloud            string   `json:"cloud,omitempty"`
	Tools            []string `json:"tools,omitempty"`
}

// Stack lists everything the project was built with, in display order.
func (p ExperienceProject) Stack() []string {
	var s []string
	s = append(s, p.Technologies...)
	s = append(s, p.Databases...)
	if p.Cloud != "" {
		s = append(s, p.Cloud)
	}
	return append(s, p.Tools...)
}

type Experience struct {
	Company  string              `json:"company"`
	Location string              `json:"location"`
	Position string              `json:"position"`
	Period   string              `json:"period"`
	Projects []ExperienceProject `json:"projects"`
	// ExcludeFromSkills keeps a non-technical position (e.g. farming) out of
	// the aggregated skills list of the short CV.
	ExcludeFromSkills bool `json:"excludeFromSkills,omitempty"`
}

type ProjectTechnologies struct {
	Languages  []string `json:"languages,omitempty"`
	Databases  []string `json:"databases,omitempty"`
	Management []string `json:"management,omitempty"`
	Cloud      string   `json:"cloud,omitempty"`
	Other      []string `json:"other,omitempty"`
}

// All lists the project's technologies in display order.
func (t ProjectTechnologies) All() []string {
	var s []string
	s = append(s, t.Languages...)
	s = append(s, t.Databases...)
	return append(s, t.Other...)
}

type Project struct {
	Icon         string              `json:"icon"`
	URL          string              `json:"url"`
	Title        string              `json:"title"`
	Content      string              `json:"content"`
	Technologies ProjectTechnologies `json:"technologies"`
	// Flagship projects get the wide banner above the project list on the website.
	Flagship bool `json:"flagship,omitempty"`
	// Featured projects are the ones shown in the short CV.
	Featured bool `json:"featured,omitempty"`
}

type Summary struct {
	Description string `json:"description"`
	// Short is the one-paragraph summary used by the short CV; falls back to Description.
	Short             string   `json:"short,omitempty"`
	FavoriteLanguages []string `json:"favorite_languages"`
}

type Me struct {
	Personal   Personal     `json:"personal"`
	Social     []Social     `json:"social"`
	Roles      []Role       `json:"roles"`
	Summary    Summary      `json:"summary"`
	Interests  []Interest   `json:"interests"`
	Languages  []Language   `json:"languages"`
	Education  []Education  `json:"education"`
	Experience []Experience `json:"experience"`
	Projects   []Project    `json:"projects"`
	Consent    string       `json:"consent"`
}

// Limits that keep the short CV on a single page.
const (
	shortBulletsRecent = 3  // bullets for the most recent position
	shortBullets       = 2  // bullets for every other position
	shortMaxProjects   = 4  // projects shown when none is marked "featured"
	shortMaxSkills     = 10 // items per skill group
)

type ShortBullet struct {
	Project string // set only when the position had more than one project
	Text    string
}

type ShortExperience struct {
	Company  string
	Location string
	Position string
	Period   string
	Stack    []string // technologies, databases, cloud and tools of all projects
	Bullets  []ShortBullet
}

type SkillGroup struct {
	Name  string
	Items []string
}

// ShortCV is the condensed view of Me rendered by templates/short.tex.tpl.
type ShortCV struct {
	Personal   Personal
	Social     []Social
	Summary    string
	Skills     []SkillGroup
	Experience []ShortExperience
	Education  []Education
	Projects   []Project
	Languages  []Language
	Consent    string
}

func (m *Me) short() ShortCV {
	cv := ShortCV{
		Personal:  m.Personal,
		Social:    m.Social,
		Summary:   m.Summary.Short,
		Skills:    m.skills(),
		Education: m.Education,
		Languages: m.Languages,
		Consent:   m.Consent,
	}
	if cv.Summary == "" {
		cv.Summary = m.Summary.Description
	}
	for i, exp := range m.Experience {
		limit := shortBullets
		if i == 0 {
			limit = shortBulletsRecent
		}
		cv.Experience = append(cv.Experience, exp.short(limit))
	}
	for _, p := range m.Projects {
		if p.Featured {
			cv.Projects = append(cv.Projects, p)
		}
	}
	if len(cv.Projects) == 0 {
		cv.Projects = m.Projects
		if len(cv.Projects) > shortMaxProjects {
			cv.Projects = cv.Projects[:shortMaxProjects]
		}
	}
	return cv
}

// short merges the position's projects into one stack line and at most
// limit bullets, taking the first responsibility of every project before
// the second one of any.
func (e Experience) short(limit int) ShortExperience {
	s := ShortExperience{
		Company:  e.Company,
		Location: e.Location,
		Position: e.Position,
		Period:   e.Period,
	}
	seen := map[string]bool{}
	add := func(items ...string) {
		for _, it := range items {
			if it != "" && !seen[it] {
				seen[it] = true
				s.Stack = append(s.Stack, it)
			}
		}
	}
	for _, p := range e.Projects {
		add(p.Technologies...)
		add(p.Databases...)
		add(p.Cloud)
		add(p.Tools...)
	}
	for round := 0; len(s.Bullets) < limit; round++ {
		added := false
		for _, p := range e.Projects {
			if round >= len(p.Responsibilities) || len(s.Bullets) >= limit {
				continue
			}
			b := ShortBullet{Text: p.Responsibilities[round]}
			if len(e.Projects) > 1 {
				b.Project = p.Name
			}
			s.Bullets = append(s.Bullets, b)
			added = true
		}
		if !added {
			break
		}
	}
	return s
}

// skills aggregates the stack of every technical position. Each item lands in
// the group it was listed under most often and groups are ordered by how many
// positions used the item, then by first appearance (most recent job first).
func (m *Me) skills() []SkillGroup {
	groups := []SkillGroup{{Name: "Technologies"}, {Name: "Databases"}, {Name: "Infrastructure"}}

	type stat struct {
		perGroup [3]int
		order    int
	}
	stats := map[string]*stat{}
	for _, exp := range m.Experience {
		if exp.ExcludeFromSkills {
			continue
		}
		seen := map[string]bool{} // count an item once per position
		count := func(group int, items ...string) {
			for _, it := range items {
				if it == "" || seen[it] {
					continue
				}
				seen[it] = true
				st, ok := stats[it]
				if !ok {
					st = &stat{order: len(stats)}
					stats[it] = st
				}
				st.perGroup[group]++
			}
		}
		for _, p := range exp.Projects {
			count(0, p.Technologies...)
			count(1, p.Databases...)
			count(2, p.Cloud)
			count(2, p.Tools...)
		}
	}

	type entry struct {
		name  string
		total int
		order int
	}
	var buckets [3][]entry
	for name, st := range stats {
		best, total := 0, 0
		for g, c := range st.perGroup {
			total += c
			if c > st.perGroup[best] {
				best = g
			}
		}
		buckets[best] = append(buckets[best], entry{name, total, st.order})
	}
	for g := range groups {
		b := buckets[g]
		sort.Slice(b, func(i, j int) bool {
			if b[i].total != b[j].total {
				return b[i].total > b[j].total
			}
			return b[i].order < b[j].order
		})
		for i, e := range b {
			if i == shortMaxSkills {
				break
			}
			groups[g].Items = append(groups[g].Items, e.name)
		}
	}
	return groups
}

// ContactPage is the data rendered by templates/contact.html.tpl.
type ContactPage struct {
	*Me
	// QR is an inline SVG encoding the vCard itself, so scanning it offers
	// to save the contact without opening any page.
	QR string
}

var vcardEscaper = strings.NewReplacer(`\`, `\\`, ";", `\;`, ",", `\,`, "\n", `\n`)

// vcard builds a vCard 3.0, the version phone cameras understand best.
// The full card goes into contact.vcf. The compact one, for the QR code,
// keeps only what is needed to reach me: every byte less makes the code
// coarser and easier to scan.
func (m *Me) vcard(full bool) string {
	p := m.Personal
	esc := vcardEscaper.Replace

	given, family := p.Name, ""
	if i := strings.LastIndex(p.Name, " "); i >= 0 {
		given, family = p.Name[:i], p.Name[i+1:]
	}
	phone := strings.ReplaceAll(p.Phone, " ", "")

	lines := []string{
		"BEGIN:VCARD",
		"VERSION:3.0",
		"N:" + esc(family) + ";" + esc(given) + ";;;",
		"FN:" + esc(p.Name),
	}
	if full {
		locality, country, _ := strings.Cut(p.Location, ", ")
		lines = append(lines,
			"TITLE:"+esc(p.Title),
			"TEL;TYPE=CELL:"+phone,
			"EMAIL;TYPE=INTERNET:"+p.Email,
			"URL:https://"+p.Website,
			"ADR:;;;"+esc(locality)+";;;"+esc(country),
		)
	} else {
		lines = append(lines,
			"TEL:"+phone,
			"EMAIL:"+p.Email,
			"URL:https://"+p.Website,
		)
	}
	lines = append(lines, "END:VCARD")
	return strings.Join(lines, "\r\n") + "\r\n"
}

// qrSVG renders text as a QR code: black modules on a white square that
// includes the 4-module quiet zone scanners expect.
func qrSVG(text string) (string, error) {
	code, err := qr.Encode(text, qr.M)
	if err != nil {
		return "", err
	}

	const quiet = 4
	size := code.Size + 2*quiet

	var b strings.Builder
	fmt.Fprintf(&b, `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 %d %d" shape-rendering="crispEdges" aria-hidden="true">`, size, size)
	fmt.Fprintf(&b, `<rect width="%d" height="%d" fill="#fff"/><path fill="#000" d="`, size, size)
	for y := 0; y < code.Size; y++ {
		for x := 0; x < code.Size; x++ {
			if !code.Black(x, y) {
				continue
			}
			run := 1
			for x+run < code.Size && code.Black(x+run, y) {
				run++
			}
			fmt.Fprintf(&b, "M%d %dh%dv1h-%dz", x+quiet, y+quiet, run, run)
			x += run
		}
	}
	b.WriteString(`"/></svg>`)
	return b.String(), nil
}

var htmlFuncs = template.FuncMap{
	"lower": strings.ToLower,
	"nospace": func(s string) string {
		return strings.ReplaceAll(s, " ", "")
	},
	"join": strings.Join,
	// current reports whether a period like "Jul. 2026 - Present" is ongoing.
	"current": func(period string) bool {
		return strings.HasSuffix(period, "Present")
	},
}

var texFuncs = template.FuncMap{
	"sub": func(a, b int) int {
		return a - b
	},
	"newlineSentences": func(text string) string {
		// Replace ". " with ".\\n" for LaTeX line breaks
		return strings.ReplaceAll(text, ". ", ".\\\\\n")
	},
	"join": strings.Join,
}

// render executes the template file at tplPath with data into outPath.
func render(tplPath, outPath string, funcs template.FuncMap, data interface{}) {
	name := filepath.Base(tplPath)
	t, err := template.New(name).Funcs(funcs).ParseFiles(tplPath)
	if err != nil {
		log.Fatal(err)
	}

	f, err := os.OpenFile(outPath, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		if err := f.Close(); err != nil {
			log.Fatal(err)
		}
	}()

	if err = t.Execute(f, data); err != nil {
		log.Fatal(err)
	}
}

func main() {
	meJSON, err := os.ReadFile("./templates/me.json")
	if err != nil {
		log.Fatal(err)
	}

	var me Me
	if err = json.Unmarshal(meJSON, &me); err != nil {
		log.Fatal(err)
	}

	contactQR, err := qrSVG(me.vcard(false))
	if err != nil {
		log.Fatal(err)
	}
	if err = os.WriteFile("contact.vcf", []byte(me.vcard(true)), 0644); err != nil {
		log.Fatal(err)
	}

	render("./templates/index.html.tpl", "index.html", htmlFuncs, &me)
	render("./templates/contact.html.tpl", "contact.html", htmlFuncs, ContactPage{Me: &me, QR: contactQR})
	render("./templates/main.tex.tpl", "./texassets/main.tex", texFuncs, &me)
	render("./templates/short.tex.tpl", "./texassets/short.tex", texFuncs, me.short())
}
