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
  <div class="pure-u-1 pure-u-md-1-2">
    <p>
      The <span class="dnd">Data & Design</span> Group is an interdisciplinary research group that uses design to understand and reimagine socio-technical systems at CU Boulder and beyond. We exist to tackle challenging design problems that matter by creating impactful systems, growing scientific knowledge, and imagining a better world.
    </p>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-md-1-4">&nbsp;</div>
  <div class="pure-u-1 pure-u-md-1-2">
    {% for theme in site.data.research_themes %}
      <div id="theme-{{theme.key}}" class="theme" data-url="{{theme.url}}" data-people="{{theme.people}}">
        <div class="content">
          <h3>{{theme.name}}</h3>
          {{theme.desc | markdownify}}
        </div>
      </div>
    {% endfor %}
  </div>
</div>
