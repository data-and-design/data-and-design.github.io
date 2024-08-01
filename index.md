---
layout: page
home: true
---

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2" markdown="1">

The <span class="dnd">Data & Design</span> Group is an interdisciplinary research group that uses design to understand and reimagine socio-technical systems.

We envision a world where people have the power to shape the design of systems that affect their social and political lives.

We are known for our work on <a href="#">accessibility in interactive data analysis</a> and <a href="#">consent and refusal in data ethics</a>.

Our group is part of the <a href="https://www.colorado.edu/cmci/infoscience">Department of Information Science</a> at the <a href="https://www.colorado.edu/">University of Colorado Boulder</a>.

  </div>
</div>

<div class="pure-g">
  <div class="pure-u-1-2 pure-u-md-3-4">
  &nbsp;
  </div>
  <div class="pure-u-1-2 pure-u-md-1-4">
    <div class="index-meta">
      <div class="index-meta__time"></div>
      <div class="index-meta__weather"></div>
    </div>
  </div>
</div>

<div class="pure-g">
  <div class="pure-u-md-1-4">
  &nbsp;
  </div>
  <div class="pure-u-1 pure-u-md-1-2">
    <h1>Research themes</h1>

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

<div class="pure-g">
  <div class="pure-u-md-1-2">
    &nbsp;
  </div>
  <div class="pure-u-1 pure-u-md-1-2">
    <h1>Stay in touch</h1>

    <p>
      <a href="https://twitter.com/cudatadesign">Twitter</a>
    </p>

    <p>
      Sign up for occasional email updates about our work.
    </p>

    <p>
      substack signup here
    </p>

  </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.45/moment-timezone-with-data.min.js"></script>
<script>
  $(document).ready(function() {
    setTime();

    var lastWeatherString = localStorage.getItem("lastWeather");
    var lastWeather = new Date(lastWeatherString);
    var now = new Date();

    if (lastWeatherString == null || now - lastWeather > 60*60*1000) {
      const weather_api = "https://api.open-meteo.com/v1/forecast?latitude=40&longitude=-105.27&current=temperature_2m&temperature_unit=fahrenheit";
      $.get(weather_api, function(data) {
        var weather = data.current.temperature_2m;
        localStorage.setItem("weather", weather);
        localStorage.setItem("lastWeather", (new Date()).toString());
        $(".index-meta__weather").html(weather + " °F");
      });
    }
    else {
      var weather = localStorage.getItem("weather");
      $(".index-meta__weather").html(weather + " °F");
    }
  });

  function setTime() {
    var time = moment().tz("America/Denver").format("h:mma") + " in Boulder, CO";
    $(".index-meta__time").html(time);
    setTimeout(function() {
      setTime();
    }, 1000);
  }
</script>

<!-- <div class="monotone">
  <img src="/imgs/people/jzong.jpg" />
</div> -->

<!--
<p id="mission">
  We use visualization as a petri dish
  to study <strong>intelligence augmentation</strong>:
  how can computation help amplify our cognition and creativity,
  while respecting our agency?
</p>

<div id="home" class="pure-g">
  <div id="themes" class="pure-u-1 pure-u-md-3-5">
    <h2>Research Themes</h2>
    {% for theme in site.data.research_themes %}
      <div id="theme-{{theme.key}}" class="theme" data-url="{{theme.url}}" data-people="{{theme.people}}">
        <video muted loop playsinline>
          <source src="/videos/themes/{{theme.key}}.mp4" type="video/mp4">
        </video>
        <div class="content">
          <h3>{{theme.name}}</h3>
          {{theme.desc | markdownify}}
        </div>
      </div>
    {% endfor %}
  </div>

  <div class="pure-u-1 pure-u-md-2-5">
    <h2 id="news-header">News</h2>
    <div id="news">
      <div id="news-items">
        {% for item in site.data.news limit: 10 %}
          <div class="item">
            <p class="date">{{item.date}}</p>
            {{item.desc | markdownify}}
          </div>
        {% endfor %}
      </div>
    </div>

    <h2 id="people-header">People</h2>
    <div id="people" class="pure-g">
      {% assign members = site.data.people | filter_alumni: nil | sort_people: 'Professor, Administrative', false %}
      {% for person in members %}
        {% unless person.external %}
        <div id="{{person[0]}}" class="person pure-u-1-4">
          <a href="{{person[1].url}}">
            <p class="headshot"><img src="/imgs/people/{{person[0]}}.jpg" alt="" /></p>
            <p class="name">{{person[1].name}}</p>
            <p class="title">{{person[1].title}}</p>
          </a>
        </div>
        {% endunless %}
      {% endfor %}
    </div>

    <h3 id="alumni-header">Alumni</h3>
    <ul id="alumni" class="pure-g">
      {% assign alumni = site.data.people | filter_alumni: true | sort_people: 'PhD, Postdoctoral, Scientist' %}
      {% for person in alumni  %}
        <li id="{{person[0]}}" class="person pure-u-1-2">
          <a href="{{person[1].url}}">
            <span class="headshot">
              <img src="/imgs/people/{{person[0]}}.jpg" alt="" />
            </span>
            <span>
              <span class="name">{{person[1].name}}</span><br>
              <span class="title">
                {{person[1].title}}
                {% if person[1].next %}
                  <br>
                  &rdca; {{person[1].next}}
                {% endif %}
              </span>
            </span>
          </a>
        </li>
      {% endfor %}
    </ul>

  </div>
</div> -->
