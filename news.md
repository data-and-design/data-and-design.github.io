---
layout: page
title: News
---

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-3-4">
    
    <h1>News & Updates</h1>
      <div class="news-section">
      <ul class="news-items">
        {% assign sorted_news = site.data.news | sort: 'date' | reverse %}
        {% for item in sorted_news %}
          <li class="news-item">
            <div class="news-date">{{ item.date | date: "%B %-d, %Y" }}</div>
            <div class="news-content">{{ item.content | markdownify }}</div>
          </li>
        {% endfor %}
      </ul>
    <div>
    
  </div>
</div>