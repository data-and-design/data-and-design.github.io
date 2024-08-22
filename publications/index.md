---
title: Publications
layout: page
---

<div class="pure-g">
  <div class="pure-u-md-1-12">
  &nbsp;
  </div>
  <div class="pure-u-1 pure-u-md-11-12">
    <h1>Publications</h1>
  </div>
</div>

<div id="pubs" class="pure-g">
  <div class="pure-u-1">
    {% assign pubYears = site.pubs | group_by:"year" | sort: "name" | reverse %}
    {% for year in pubYears %}
      {% assign pubs = year.items | sort: 'date' | reverse %}
      {% for pub in pubs %}
        {% assign url = pub.external_url | default: pub.url | relative_url | replace: 'index.html', '' %}
        <div id="{{pub.slug}}" class="publication pure-g">
          <div class="pure-u-1 pure-u-md-1-5">
            {% if forloop.first == true %}
              <h2 class="year">{{year.name}}</h2>
            {% else %}
              &nbsp;
            {% endif %}
          </div>

          <div class="pure-u-1 pure-u-md-4-5">
            <h3 class="title"><a href="{{url}}">{{pub.title}}</a></h3>
            <div class="authors">
            {% for author in pub.authors %}
              {% assign person = site.data.authors[author.key] %}
              {% assign name = author.name | default:person.name %}
              {% if person.url or author.url %}
                <a href="{{person.url | default: author.url}}">{{name}}</a>{% if author.equal %}*{% endif %}{% unless forloop.last %}, {% endunless %}
              {% else %}
                {{name}}{% if author.equal %}*{% endif %}{% unless forloop.last %}, {% endunless %}
              {% endif %}
            {% endfor %}
            </div>
            <div class="venue">
              {% if pub.preprint %}
                {{pub.preprint.server}}: {{pub.preprint.id}}
              {% else %}
                {{site.data.venues[pub.venue].short}}, {{pub.year}}
              {% endif %}
            </div>
            {% if pub.award %}
              <div class="award">
                <i class="fas fa-award"></i> {{pub.award}}
              </div>
            {% endif %}

            <div class="links">
              {% if pub.external_url %}
                <a href="{{pub.external_url}}">
                  {% if pub.preprint %}Preprint{% else %}Article{% endif %}
                </a>
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
            </div>
          </div>
        </div>
      {% endfor %}
    {% endfor %}

  </div>

</div>
