package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"os"
	"strings"
	"text/template"
)

type Personal struct {
	Name        string `json:"name"`
	Title       string `json:"title"`
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

type Interest struct {
	Name string `json:"name"`
	Icon string `json:"icon"`
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

type Experience struct {
	Company  string              `json:"company"`
	Location string              `json:"location"`
	Position string              `json:"position"`
	Period   string              `json:"period"`
	Projects []ExperienceProject `json:"projects"`
}

type ProjectTechnologies struct {
	Languages  []string `json:"languages,omitempty"`
	Databases  []string `json:"databases,omitempty"`
	Management []string `json:"management,omitempty"`
	Cloud      string   `json:"cloud,omitempty"`
	Other      []string `json:"other,omitempty"`
}

type Project struct {
	Icon         string              `json:"icon"`
	URL          string              `json:"url"`
	Title        string              `json:"title"`
	Content      string              `json:"content"`
	Technologies ProjectTechnologies `json:"technologies"`
}

type Summary struct {
	Description       string   `json:"description"`
	FavoriteLanguages []string `json:"favorite_languages"`
}

type Me struct {
	Personal   Personal     `json:"personal"`
	Social     []Social     `json:"social"`
	Summary    Summary      `json:"summary"`
	Interests  []Interest   `json:"interests"`
	Languages  []Language   `json:"languages"`
	Education  []Education  `json:"education"`
	Experience []Experience `json:"experience"`
	Projects   []Project    `json:"projects"`
	Consent    string       `json:"consent"`
}

func (m *Me) rebuildHTML() {
	t, err := template.New("html").Funcs(template.FuncMap{
		"splitp": func(i int) bool {
			return i != 0 && i != len(m.Projects)-1 && (i+1)%3 == 0
		},
		"lower": func(s string) string {
			return strings.ToLower(s)
		},
	}).ParseFiles("./templates/index.html.tpl")
	if err != nil {
		log.Fatal(err)
	}

	f, err := os.OpenFile("index.html", os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		if err := f.Close(); err != nil {
			log.Fatal(err)
		}
	}()

	if err = t.Lookup("index.html.tpl").Execute(f, m); err != nil {
		log.Fatal(err)
	}
}

func (m *Me) rebuildLatex() {
	t, err := template.New("tex").Funcs(template.FuncMap{
		"sub": func(a, b int) int {
			return a - b
		},
		"len": func(slice interface{}) int {
			switch v := slice.(type) {
			case []Experience:
				return len(v)
			case []Education:
				return len(v)
			case []Project:
				return len(v)
			default:
				return 0
			}
		},
		"newlineSentences": func(text string) string {
			// Replace ". " with ".\\n" for LaTeX line breaks
			return strings.ReplaceAll(text, ". ", ".\\\\\n")
		},
		"join": func(arr []string, sep string) string {
			return strings.Join(arr, sep)
		},
	}).ParseFiles("./templates/main.tex.tpl")
	if err != nil {
		log.Fatal(err)
	}

	f, err := os.OpenFile("./texassets/main.tex", os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		if err := f.Close(); err != nil {
			log.Fatal(err)
		}
	}()

	if err = t.Lookup("main.tex.tpl").Execute(f, m); err != nil {
		log.Fatal(err)
	}
}
func main() {
	meJSON, err := ioutil.ReadFile("./templates/me.json")
	if err != nil {
		log.Fatal(err)
	}

	var me Me
	if err = json.Unmarshal(meJSON, &me); err != nil {
		log.Fatal(err)
	}

	me.rebuildHTML()
	me.rebuildLatex()
}
