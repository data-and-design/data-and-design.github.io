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
          <a href="/projects/{{project.slug}}">
            {% if project.imgAlt %}
              <div class="monotone">
                <img src="/imgs/thumbs/{{project.key}}.png" alt="{{project.imgAlt}}" />
              </div>
            {% endif %}
            <h2>{{project.title}}</h2>
            <div>{{project.description | capitalize}}</div>
          </a>
        </div>
      {% endfor %}
    {% endfor %}
</div>
