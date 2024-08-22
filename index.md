---
layout: page
home: true
---

<div class="pure-g">
  <div class="pure-u-1 pure-u-md-1-2" markdown="1">

The <span class="dnd">Data & Design</span> Group is an interdisciplinary research group that uses design to understand and reimagine socio-technical systems.

We envision a world where people have the power to shape the design of systems that affect their social and political lives.

We are known for our work on <a href="/research#theme-access">accessibility in interactive data analysis</a> and <a href="/research#theme-refusal">consent and refusal in data ethics</a>.

Our group is part of the <a href="https://www.colorado.edu/cmci/infoscience">Department of Information Science</a> at the <a href="https://www.colorado.edu/">University of Colorado Boulder</a>.

<a href="/about" class="arrow-link">Read more <span aria-hidden>&rarr;</span></a>

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
          <h3><a href="/research#theme-{{theme.key}}">{{theme.name}}</a></h3>
          {{theme.desc | markdownify}}
        </div>
      </div>
    {% endfor %}

    <p>
        <a href="/research" class="arrow-link">Read more <span aria-hidden>&rarr;</span></a>
    </p>
    <p>
        <a href="/projects" class="arrow-link">See projects <span aria-hidden>&rarr;</span></a>
    </p>
    <p>
        <a href="/publications" class="arrow-link">See all publications <span aria-hidden>&rarr;</span></a>
    </p>

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
      <a href="https://github.com/data-and-design/">Github</a>
    </p>
    <p>
      {% include hiring-cta.html %}
    </p>

  </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.45/moment-timezone-with-data.min.js"></script>
<script>
  function wmo_code(weather_code) {
    switch (weather_code) {
      case 0:
        return 'clear sky';
      case 1:
        return 'mostly clear';
      case 2:
        return 'partly cloudy';
      case 3:
        return 'overcast';
      case 45:
      case 48:
        return 'foggy';
      case 51:
      case 56:
        return 'light drizzle';
      case 53:
        return 'moderate drizzle';
      case 55:
      case 57:
        return 'dense drizzle';
      case 61:
      case 66:
      case 80:
        return 'light rain';
      case 63:
      case 81:
        return 'moderate rain';
      case 65:
      case 67:
      case 82:
        return 'heavy rain';
      case 71:
      case 85:
        return 'light snow';
      case 73:
        return 'moderate snow';
      case 75:
      case 86:
        return 'heavy snow';
      case 77:
        return 'snow grains';
      case 95:
      case 96:
      case 99:
        return 'thunderstorm';
      default:
        return '';
    }
  }
  $(document).ready(function() {
    setTime();

    var lastWeatherString = localStorage.getItem("lastWeather");
    var lastWeather = new Date(lastWeatherString);
    var now = new Date();

    if (lastWeatherString == null || now - lastWeather > 60*60*1000) {
      const weather_api = "https://api.open-meteo.com/v1/forecast?latitude=40&longitude=-105.27&current=temperature_2m,weather_code&temperature_unit=fahrenheit";
      $.get(weather_api, function(data) {
        console.log(data);
        var weather = `${data.current.temperature_2m}°F ${wmo_code(data.current.weather_code)}`;
        localStorage.setItem("weather", weather);
        localStorage.setItem("lastWeather", (new Date()).toString());
        $(".index-meta__weather").html(weather);
      });
    }
    else {
      var weather = localStorage.getItem("weather");
      $(".index-meta__weather").html(weather);
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
