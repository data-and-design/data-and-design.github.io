---
title: Publications
layout: page
---

<div id="pubs" class="pure-g">
  <div id="content" class="pure-u-1 pure-u-md-3-4">
    <h1 class="title">Our Publications</h1>

    {% assign pubYears = site.pubs | group_by:"year" | sort: "name" | reverse %}
    {% for year in pubYears %}
      <div id="year-{{year.name}}" class="year pure-g">
        <div class="pure-u-1-3 pure-u-md-1-5"></div>
        <div class="pure-u-2-3 pure-u-md-4-5">
          <h2>{{year.name}}</h2>
        </div>
      </div>

      {% assign pubs = year.items %}
      {% for pub in pubs %}
        {% assign url = pub.external_url | default: pub.url | relative_url | replace: 'index.html', '' %}
        <div id="{{pub.slug}}" class="pub pure-g" data-pub='{{ pub | jsonify_pub }}'>
          <!-- <div class="thumbnail pure-u-1-3 pure-u-md-1-5">
            <a href="{{url}}">
              <img src="/imgs/thumbs/{{pub.slug}}.png" alt="" />
            </a>
          </div> -->

          <div class="pure-u-2-3 pure-u-md-4-5">
            <h3><a href="{{url}}">{{pub.title}}</a></h3>
            <p class="authors">
            {% for author in pub.authors %}
              {% assign person = site.data.authors[author.key] %}
              {% assign name = author.name | default:person.name %}
              {% if person.url %}
                <a href="{{person.url}}">{{name}}</a>{% if author.equal %}*{% endif %}{% unless forloop.last %}, {% endunless %}
              {% else %}
                {{name}}{% if author.equal %}*{% endif %}{% unless forloop.last %}, {% endunless %}
              {% endif %}
            {% endfor %}
            </p>
            <p class="venue">
              {% if pub.preprint %}
                {{pub.preprint.server}}: {{pub.preprint.id}}
              {% else %}
                {{site.data.venues[pub.venue].short}}, {{pub.year}}
              {% endif %}
            </p>
            {% if pub.award %}
              <p class="award">
                <i class="fas fa-award"></i> {{pub.award}}
              </p>
            {% endif %}
            <p class="links">
              {% if pub.external_url %}
                <a href="{{pub.external_url}}">
                  {% if pub.preprint %}Preprint{% else %}Article{% endif %}
                </a>
              {% endif %}

              {% if pub.doi %}
                <p id="doi" class="links">
                  <span>DOI:</span> <a href="https://doi.org/{{pub.doi}}">{{pub.doi}}</a>
                </p>
              {% endif %}

              {% if pub.html_url %}
                <a href="{{pub.html_url}}">HTML article</a>
              {% endif %}

              {% if pub.pdf_url %}
                <a href="{{pub.pdf_url}}">PDF</a>
              {% endif %}

              {% if pub.doi or pub.reference_url %}
                <a href="{% if pub.doi %}https://doi.org/{{pub.doi}}{% elsif pub.reference_url %}{{pub.reference_url}}{% endif %}">Reference link</a>
              {% endif %}

              {% for material in pub.materials %}
                <a href="{{material.url}}">{{material.name}}</a>
              {% endfor %}
            </p>
          </div>
        </div>
      {% endfor %}
    {% endfor %}

  </div>

</div>
