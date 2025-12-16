---
layout: page
people: true
title: People
---
<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2">
    <h2>Team</h2>
    <div class="people-container">
      {% for person_tuple in site.data.authors %}
        {% assign person = person_tuple[1] %}
        {% unless person.external %}
        <div class="person">
          <div class="portrait">
            <a href="{{person.url}}">
              {% capture defaultAlt %}
                Photo of {{person.name}}
              {% endcapture %}
              <img src="/imgs/people/{{person_tuple[0]}}.jpg" alt="{{ person.imgAlt | default: defaultAlt | strip }}" />
            </a>
          </div>
          <div class="person-name"><a href="{{person.url}}">{{person.name}}</a></div>
          <div class="person-title">{{person.title}}</div>
        </div>
        {% endunless %}
      {% endfor %}
    </div>
  </div>
</div>
<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2">
    &nbsp;
  </div>
  <div class="pure-u-1 pure-u-md-1-2">
    <a href="/recruiting/" class="arrow-link"><span class="cta">Join us <span aria-hidden>&rarr;</span></span></a>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2">
    <h2>Research Collaborators</h2>
    <div class="people-container">
      {% for person_tuple in site.data.authors %}
        {% assign person = person_tuple[1] %}
        {% if person.collaborator %}
        <div class="person">
          <div class="portrait">
            <a href="{{person.url}}">
              <img src="/imgs/people/{{person_tuple[0]}}.jpg" alt="{{person.name}}" />
            </a>
          </div>
          <div class="person-name" aria-hidden><a href="{{person.url}}">{{person.name}}</a></div>
          <div class="person-title">{{person.affiliation | default: person.title}}</div>
        </div>
        {% endif %}
      {% endfor %}
    </div>
  </div>
</div>
