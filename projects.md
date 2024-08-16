---
title: Projects
layout: page
---

<div class="pure-g">
  <div class="pure-u-md-1-12">
  &nbsp;
  </div>
  <div class="pure-u-1 pure-u-md-11-12">
    <h1>Projects</h1>
  </div>
</div>

<div id="projects" class="pure-g">
  <div class="pure-u-1">
    {% assign projectYears = site.projects | group_by:"year" | sort: "title" | reverse %}
    {% for year in projectYears %}
      {% assign projects = year.items %}
      {% for project in projects %}
        <div>
          <h2><a href="/projects/{{project.slug}}">{{project.title}}</a></h2>
          <div>{{project.description | capitalize}}</div>
        </div>
      {% endfor %}
    {% endfor %}
  </div>
</div>
