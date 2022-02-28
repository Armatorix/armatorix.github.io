package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"os"
	"text/template"
)

type Project struct {
	Icon    string
	URL     string
	Title   string
	Content string
}

type Me struct {
	Projects []Project
}

func (m *Me) rebuildHTML() {
	t, err := template.New("html").Funcs(template.FuncMap{
		"splitp": func(i int) bool {
			return i != 0 && i != len(m.Projects)-1 && (i+1)%3 == 0
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
}
