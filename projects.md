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
    {% assign projectYears = site.projects | group_by:"year" | sort: "name" | reverse %}
    {% for year in projectYears %}
      {% assign projects = year.items | sort: 'date' | reverse %}
      {% for project in projects %}
        <div class="pure-u-1 pure-u-md-1-2 project">
            {% if project.imgAlt %}
              <div>
                <a href="/projects/{{project.slug}}"><img src="/imgs/projects/{{project.key}}.png" alt="{{project.imgAlt}}" /></a>
              </div>
            {% endif %}
            <a href="/projects/{{project.slug}}"><h2>{{project.title}}</h2></a>
            <a href="/projects/{{project.slug}}"><div>{{project.description | capitalize}}</div></a>
        </div>
      {% endfor %}
    {% endfor %}
</div>
