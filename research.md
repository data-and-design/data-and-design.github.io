---
layout: page
research: true
title: Research Themes
---

<div class="pure-g">
  <div class="pure-u-md-1-12">
  &nbsp;
  </div>
  <div class="pure-u-1 pure-u-md-11-12">
    <h1>Research themes</h1>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-3-4">
    <p>
      At the <span class="dnd">Data & Design</span> Group, we explore these themes in our research:
    </p>
    <ul class="themes-list">
      {% for theme in site.data.research_themes %}
        <li>
          <div>
            <a href="#theme-{{theme.key}}">{{theme.name}}</a>
          </div>
          <div class="themes-list-desc">
            {{theme.desc}}
          </div>
        </li>
      {% endfor %}
    </ul>
  </div>
</div>

<div id="themes" class="pure-g">
  <div class="pure-u-md-1-4">&nbsp;</div>
  <div class="pure-u-1 pure-u-md-1-2">
    {% for theme in site.data.research_themes %}
      <div id="theme-{{theme.key}}" class="theme">
        <div class="content">
          <h3>{{theme.name}}</h3>
          {{theme.desc | markdownify}}
          {% capture projectOutput %}
            {% assign projectYears = site.projects | group_by:"year" | sort: "name" | reverse %}
            {% for year in projectYears %}
              {% assign projects = year.items | sort: 'date' | reverse %}
              {% for project in projects %}
                {% if project.themes and project.themes contains theme.key %}
                  <li class="pub"><a href="/projects/{{project.slug}}"><span class="title">{{project.title}}</span>: {{project.description}}</a></li>
                {% endif %}
              {% endfor %}
            {% endfor %}
          {% endcapture %}
          {% assign projectOutputStrip = projectOutput | strip%}
          {% if projectOutputStrip and projectOutputStrip != '' %}
            <h4>
              Projects
            </h4>
            <ul>
            {{projectOutputStrip}}
            </ul>
          {%endif%}
          <h4>
            Publications
          </h4>
          <ul>
            {% assign pubYears = site.pubs | group_by:"year" | sort: "name" | reverse %}
            {% for year in pubYears %}
              {% assign pubs = year.items | sort: 'date' | reverse %}
              {% for pub in pubs %}
                {% if pub.themes and pub.themes contains theme.key %}
                  {% assign url = pub.external_url | default: pub.url | relative_url | replace: 'index.html', '' %}
                  {% capture authors %}
                    {% for author in pub.authors %}
                      {% assign person = site.data.authors[author.key] %}
                      {% assign name = author.name | default:person.name %}
                      {{name}}{% if author.equal %}*{% endif %}{% unless forloop.last %}, {% endunless %}
                    {% endfor %}
                  {% endcapture %}
                  <li class="pub"><a href="{{url}}">{{pub.year}}. <span class="title">{{pub.title}}</span>. {{authors | strip }}. {{site.data.venues[pub.venue].short}}. <span class="award">{{pub.award}}</span></a></li>
                {% endif %}
              {% endfor %}
            {% endfor %}
          </ul>

          {% assign exhibitions = site.data.exhibitions | where_exp: "x", "x.themes contains theme.key" %}
          {% if exhibitions and exhibitions.size > 0 %}
            <h4>
              Exhibitions
            </h4>
            <ul>
              {% for exhibition in exhibitions %}
                <li class="pub">
                  <a href="{{ exhibition.url }}">{{exhibition.year}}. <span class="title">{{ exhibition.title }}</span>. {{ exhibition.venue }}.</a>
                </li>
              {% endfor %}
            </ul>
          {% endif %}
        </div>
      </div>
    {% endfor %}

  </div>
</div>
