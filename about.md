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
      The <span class="dnd">Data & Design</span> Group is an interdisciplinary research group that uses design to understand and reimagine socio-technical systems.
    </p>
    <p>
      We are known for our work on <a href="/research#theme-access">accessibility in interactive data analysis</a> and <a href="/research#theme-refusal">consent and refusal in data ethics</a>.
    </p>
    <p>
      We are part of the <a href="https://www.colorado.edu/cmci/infoscience">Department of Information Science</a> at the <a href="https://www.colorado.edu/">University of Colorado Boulder</a>.
    </p>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-md-1-4">&nbsp;</div>
  <div class="pure-u-1 pure-u-md-1-2">
  <h2>Mission</h2>
    <p>
      At the <span class="dnd">Data & Design</span> Group, we are advancing a world where people have the power to shape the design of systems that affect their social and political lives.
    </p>
    <p>
      To do this, we pursue research that:
    </p>
    <ul>
      <li>
        <span class="mission-item">responds to practical needs</span> for people and communities by prioritizing co-design methods and investing in open source tools.
      </li>
      <li>
        <span class="mission-item">builds scientific knowledge</span> about the relationship between technology and society by using system design as a way to investigate alternate possibilities.
      </li>
      <li>
        <span class="mission-item">shapes policy and practice</span> by using our findings to lead conversations about best practices.
      </li>
    </ul>
    <!-- <br/>
    <h2>Our impact</h2>
    <p>
      These are examples of kinds of projects we do, and how they create change:
    </p>
    <ul>
      <li>
        Software tools that <span class="mission-item">advance a new point of view</span> or challenge assumptions about how systems should be designed.
      </li>
      <ul>
        <li>Examples: Umwelt, Bartleby</li>
      </ul>
      <li>
        Design frameworks that <span class="mission-item">help designers think systematically</span> about the characteristics of a class of system.
      </li>
      <ul>
        <li>Examples: Rich Screen Reader Experiences, Data Refusal as Design</li>
      </ul>
      <li>
        Theoretical analyses that <span class="mission-item">help scholars clearly understand</span> a socio-technical concept.
      </li>
      <ul>
        <li>Examples: The Seeing Subject in HCI</li>
      </ul>
      <li>
        Artworks that <span class="mission-item">explore speculative ideas</span> or draw new associations about a concept or a technology.
      </li>
      <ul>
        <li>Examples: Biometric Sans, Everyone Should</li>
      </ul>
    </ul> -->

  </div>
</div>

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2">
    <h2>Team</h2>
    <div class="people-container">
      {% for person_tuple in site.data.authors %}
        {% assign person = person_tuple[1] %}
        {% unless person.external %}
        <div class="person">
          <div class="portrait monotone">
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
    {% include hiring-cta.html %}
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
