---
layout: page
about: true
title: About
---

<div class="pure-g">
  <div class="pure-u-md-1-12">
  &nbsp;
  </div>
  <div class="pure-u-1 pure-u-md-11-12">
    <h1>About us</h1>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2">
    <p>
      The <span class="dnd">Data & Design</span> Group is an interdisciplinary research group that uses design to understand and reimagine socio-technical systems at CU Boulder and beyond. We exist to tackle challenging design problems that matter by creating impactful systems, growing scientific knowledge, and imagining a better world.
    </p>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-md-1-4">&nbsp;</div>
  <div class="pure-u-1 pure-u-md-1-2">
    <h2>Mission</h2>
    <p>
      The <span class="dnd">Data & Design</span> Group works across computer science, the social sciences and humanities, and the arts to create impact through design.
    </p>
    <ul>
      <li>
        <span class="mission-item">We empower people and communities.</span>
        Technology has the potential to help people flourish in society, but it often falls short of that promise. We work to empower people to shape the uses of technology that affect their social and political lives.
      </li>
      <li>
        <span class="mission-item">We advance design knowledge.</span> The toughest challenges at the intersection of technology and society don’t always have clear paths forward. Our research and design work addresses immediate needs while also equipping others with the knowledge they need to tackle future problems more deeply.
      </li>
      <li>
        <span class="mission-item">We express and inspire creativity.</span>
        There are many ways to ask questions and communicate ideas.
        Alongside our research and design work, we engage in artistic and cultural production to challenge conventional wisdom and see things in new ways.
      </li>
    </ul>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2">
    <h2>Core Team</h2>
    <div class="people-container">
      {% for person_tuple in site.data.authors %}
        {% assign person = person_tuple[1] %}
        {% unless person.external %}
        <div class="person">
          <div class="portrait monotone">
            <a href="{{person.url}}">
              <img src="/imgs/people/{{person_tuple[0]}}.jpg" aria-hidden="true"/>
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
    <h2>Research Collaborators</h2>
    <div class="people-container">
      {% for person_tuple in site.data.authors %}
        {% assign person = person_tuple[1] %}
        {% if person.collaborator %}
        <div class="person">
          <div class="portrait monotone">
            <a href="{{person.url}}">
              <img src="/imgs/people/{{person_tuple[0]}}.jpg" aria-hidden="true"/>
            </a>
          </div>
          <div class="person-name"><a href="{{person.url}}">{{person.name}}</a></div>
          <div class="person-title">{{person.title}}</div>
        </div>
        {% endif %}
      {% endfor %}
    </div>
  </div>
</div>
