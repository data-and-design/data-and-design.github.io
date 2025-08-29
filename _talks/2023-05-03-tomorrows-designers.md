---
layout: talk
title: "Tomorrow's Designers Designing Today"
author: jzong
youtube_url: https://www.youtube-nocookie.com/embed/lNvPY8-FrvY?si=u_7ZZgcCqh1Bqa2L
---

_This talk was part of [an event at the MIT Morningside Academy for Design](https://design.mit.edu/events/tomorrow-s-designers-designing-today) during Boston Design Week._

## Introduction by Svafa Grönfeldt

One of the things I was really pleased to hear is that you were sharing all the examples of what you call "not so good designs." But this is the beauty of design—it's so free. There's so much freedom in actually being able to design because you have the freedom to iterate again and again and again until you get it right. This is really important when we're using design to solve complex problems because we're not going to solve it in the first go for sure. Having that freedom to be able to experiment and having the freedom to fail is absolutely crucial.

Let me introduce our next speaker, Jonathan Zong. He's a computer scientist now in his fifth year of his PhD at MIT CSAIL, where he's working with the Visualization Group. Not only has he been recognized as a MAD Fellow, but also recognized by the Soros Fellowship and Forbes 30 Under 30. He's joined today with his advisor, Professor Arvind Satyanarayan, Associate Professor and leader of the Visualization Group at MIT CSAIL.

Please welcome Jonathan to the stage.

## The Problem: Visual Disability and Web Accessibility

Thank you so much for that introduction, Svafa.GrönfeldtI'm excited to share my work today on designing accessible data visualizations for blind and low-vision users.

According to a survey by the National Federation of the Blind, 7 million people in the United States have a visual disability. For many of these people, and more globally, 96.8% of the top 1 million pages on the internet are simply not accessible to the screen reader assistive technology that they use almost every day.

## How Screen Readers Work

If you're not familiar with how screen readers work, there's essentially a cursor which moves around the page, and the user can use keyboard shortcuts to move this cursor around. Whatever is selected by the cursor will be read out as text-to-speech.

Here, I can demonstrate what the accessible HTML version of our paper looks like to a screen reader:

*[Screen reader demonstration]*
> "Visit link, heading level 1. Hi. We're the MIT Visualization Group. Visit link. Home. Link, link, link, link. Heading level 1. Which screen reader experiences were accessible to visualization? Link, link, link, link. Past paper honorable mention. Article. You are currently on an article. Heading level 2, two items. Abstract. Current accessibility guidelines ask designers to support screen readers by basic non-visual alternatives like textual description."

That's the experience of the internet that you can expect if you're using a screen reader. But often when you're dealing with image content, if the authors of the web page haven't provided an alternative text description of the image, your experience will look more like this:

> "Image. Image. Image. Image. Image. Image. Image."

## The Challenge: Making Charts Accessible

In the work that I've been doing with the Visualization Group and as a MAD Fellow this year, I've been thinking about this question: How do we make charts, which are a particular kind of image content, more accessible to screen reader users?

There are a couple of reasons why this is a challenging and interesting design question, because this is essentially a question of cross-sensory translation. Visualizations and text descriptions just work differently. Charts have various visual features that, as a reader, you can shift your attention around—look at high-level patterns, look at individual data points—and you can do this on the fly. But if you're using a screen reader, the text description imposes a linear, predefined reading order. You're beholden to the decisions that the person who wrote the text made about what information was important to include.

## Current Best Practices and Their Limitations

Let me walk through an example of what current best practices for making charts accessible look like, using an election map example.

### Alt Text
If someone were to provide an alternate textual description of that map, it might look something like this:

> "A map of 2020 US Presidential Election results. Joe Biden has 227 electoral votes, Donald Trump has 213 electoral votes, 98 votes remain."

Alt text has some strengths and some limitations. One great thing about alt text is that it gives you a high-level overview of the data pretty efficiently. After listening to those couple of sentences, I know what the general takeaway of the map is. But on the flip side, there's no way to do self-guided data exploration. If I know the number of votes that Joe Biden has but I want to know how many of those votes came from each state, if that information is not included in the sentence, then there's no way to find out.

### Data Tables
The other way that people make charts accessible on the internet is by including a data table of the underlying data that the chart is representing. Data tables address this limitation of alt text—they enable detailed exploration that you can do in a self-guided manner. You can use your screen reader to move around the different parts of the table as you please. But with data tables, it's very tedious and time-consuming to build a mental picture of what's going on with the data. If you're reading individual data rows one by one, there's a lot that you have to remember in order to understand higher-level patterns.

## Introducing Olli: A New Approach

To address the limitations of these existing practices, our group at MIT Vis has been developing [**Olli**](https://mitvis.github.io/olli/), which is an open source JavaScript library for converting data visualizations on the internet into keyboard-navigable textual descriptions that both allow you to get high-level overviews in the form of text and also navigate around varying levels of detail and do self-guided exploration. This is something that's open source and people can use it today.

### Olli Demo: Penguin Scatterplot

Here's a demo of how Olli works. Pay attention to how we are moving between text descriptions at varying levels of detail.

On the screen, we have a scatterplot showing data about different species of penguins. We have the corresponding Olli output, which is a keyboard-navigable text structure with descriptions at different levels of detail.

If I'm using a screen reader and I come across this chart while navigating a web page, if I read out the top-level Olli description, I'll get some information about what kind of chart this is:

> "A scatter plot showing body mass and flipper length of penguins. A scatter plot with axes flipper length (mm) and body mass (g)."

If I want to explore this chart further, I can press the down arrow key to go down a level of detail in the Olli structure. On that next level, I'll receive descriptions of the different axes and legends of the chart:

> "X-axis title: flipper length (mm), for a quantitative scale with values from 170 to 230."

Now that I'm on this level, I can press the left and right arrow keys to go through the different descriptions on this level:

> "Y-axis title: body mass (g), for a quantitative scale with values from 3,000 to 6,000."
> 
> "Legend title: species for color with three values starting with Adelie and ending with Gentoo."

If I want to explore the chart along the x-axis, I can navigate back to the x-axis node and press down again to get information about the intervals along the x-axis:

> "170 to 180: 8 values."
> "180 to 190: 69 values."  
> "190 to 200: 113 values."

By moving along these intervals and getting information about how much data is contained within each interval, I'm building an understanding of how the data is distributed along this axis.

If I'm interested in that interval between 170 and 180, I can go back to that node and press the down arrow again to access a table of the individual data points:

> "170 to 180: 8 values. Table with 8 rows."

From here, I can use built-in screen reader keyboard commands to navigate this table and read out individual data points.

## Design Goals of Olli

How is Olli different from prior best practices? We prioritize these design goals:

1. **Open-ended, self-guided exploration** - Screen reader users can control their position within this hierarchy at their own pace
2. **Descriptions at varied levels of detail** - If a high-level description isn't enough information for you, you can dive in deeper and get more specific about the data

## Future Work: Multisensory Data Representations

Now to preview what's next in this work—this is work that I've been doing this past spring that I haven't shown publicly yet—we've been thinking about this question of multisensory data representations.

Currently, accessibility approaches are very vision-centric. We started with a chart and converted it into a text description, and we're still thinking about these two things as very independent entities. But what if we think about using all these different modalities together in one system?

### Integrated Visualization Demo

Here's a demo of a version of Olli that's more integrated with the visualization so that blind data analysts and their sighted collaborators can have a common point of reference. As I navigate the structure here, you'll see that the visualization updates to show where the screen reader is focused:

> "A multi-series line chart showing stock prices of five tech companies over time."
> "One of five: Line title: MSFT with axes date and price."
> "Two of five: Line title: AMZN with axes date and price."
> "Three of five: Line title: IBM with axes date and price."
> "Four of five: Line title: GOOGL with axes date and price."  
> "Five of five: Line title: AAPL with axes date and price."

### Data Sonification

We can integrate other forms of sensory modalities with their own pros and cons, like data sonification, which is very good for giving a gist of large amounts of data very quickly but can't really tell you about individual data values.

*[Digital tones representing data sonification]*

### AI-Powered Contextual Analysis

We can't escape talking about ChatGPT when we're talking about textual content. We've also been exploring methods where we query GPT to offer additional analysis of the data that's situated in the hierarchy.

For example, when examining Amazon's stock data from 1998-2000:

> "Amazon (AMZN) started the year 2000 with a stock price of $64.56, which rose to $68.87 by February 1st, reflecting the company's growth and potential for success in the tech industry. However, the dot-com bubble burst in March 2000, causing a significant decline in stock prices for many tech companies, including Amazon."

What I find really interesting about that is that this information can incorporate not just information that's in the data, but information that accounts for things like current events and social context. That can provide another avenue for helping people through analysis.

The model provides information about things like product launches and entering into new markets to contextualize the data that you're looking at. It knows about events like the global financial crisis in 2008 and offers that as a hypothesis for why your data is the way that it is.

Doing this situated in the Olli structure means that rather than relying on it to summarize your entire dataset, you can use it to understand targeted subsets of your data and also verify its claims against the data that you already have on hand.

## Acknowledgments

I want to thank my enormous list of collaborators. A special shout-out to Daniel Hajas, who's a blind researcher based at the Global Disability Innovation Hub in London who's been an important co-design and research partner. And also my two current master's and undergrad advisees, Shuli Jones and Isabella Pedraza Piñeros.

Thank you so much, and I look forward to the conversations today.

---

## Q&A with Arvind Satyanarayan

**Arvind:** That was really awesome. Even though I've seen the work day to day, week to week, it's nice to see it come together and hear you tell the story of it. I was thinking about particularly the way you were introduced as a computer scientist. I'm curious if I can prompt you to reflect—I think the computer science bit of your identity is only part of what makes you such an effective designer. I'm curious about the path that led you to working on accessibility and how maybe it's prompting you to draw on other parts of your skill set.

**Jonathan:** Thank you, Arvind. Coming out of undergrad, I did undergrad at Princeton, where I studied computer science and visual arts with a focus in graphic design. I think I stumbled into data visualization just because it seemed like a natural intersection of those two things.

Within computer science, my undergrad thesis was around the ethics of data collection and designing systems to support people in saying no to researchers who want to collect their data. I think there are a few through lines from that work that I've tried to bring into the accessibility work.

One is the idea of designing systems that support people's autonomy and agency and making software flexible enough to allow people to express their preferences and their values. Another is just the idea of design as something that can help us answer or at least make progress on really tough social and ethical questions.

In the ethics work, that looked like drawing from ideas in feminist philosophy to understand how we should interpret the way that users interact with a system that's designed around them. In the accessibility work, it's thinking about broader conversations in disability studies about how there's no such thing as one-size-fits-all solutions and really taking that to heart when we design software.

**Arvind:** I love it because you set me up for my next question. Riffing on that "one size fits all," I was curious about this notion in accessibility called the curb cut effect, where something that was designed for accessibility purposes ends up having a larger impact and benefit for everyone. I'm curious whether you're seeing some of that emerge in your work, whether it's in the specific things you showed us today or in your thinking around the ethical implications of user agency and autonomy.

**Jonathan:** Absolutely. One thing that we've discussed a lot amongst our collaborators is the idea that for accessible representations—textual representations of data—why even refer to the visualization? Why do blind users need to know that there's an x- and a y-axis?

I think part of that is just that we're all situated in our social and relational contexts. Blind folks have sighted friends, and they want to talk to them about the data that they're looking at. So it's important to create those common reference points even as we're translating the modality that people access this information through.

With the work that I was showing at the end, we're really thinking about facilitating collaboration between blind and sighted users in a way that benefits everybody. Having access to those multiple modalities just gives you more options for understanding and analyzing your data.

Something that we've talked about a lot too is there's increasing momentum around accessibility in data visualization right now and increasing recognition that this is an important issue. Part of what we're trying to show with our work is that it's both important because it's socially important, but it's also just a very interesting and intellectually rich area for design. There are all these questions about what are the different relative strengths of these different sensory modalities that will feed back into creating better data visualizations.

**Arvind:** I really love that point that it's not only the morally right thing to do, but it's just intellectually deep and interesting. These two things don't have to be mutually exclusive. I was curious about what that means in the context of that really provocative demo that we ended on of the GPT doing the data analysis—I don't even know if that's the right way to describe it. I'm curious, I know that it's a very early prototype, but what are some of your hunches about what the balance we might want to achieve there might be?

**Jonathan:** Absolutely. I went back and forth a lot on the title for that slide and how to describe what was happening. Something that's come up a lot in our conversations with blind and low-vision users is just the idea of agency and who is in charge of doing the interpreting.

When one of my colleagues, Alan, tested a lot of different kinds of textual descriptions with folks, we realized that for sighted people, people really like descriptions that do a lot of interpretation and analysis and give you the high-level takeaway, because we can look at the chart and do the low-level numbers accessing stuff relatively quickly. But for blind and low-vision users, they actually didn't like those too "interpret-y" descriptions because they felt it was taking away their ability to draw their own conclusions first by engaging directly with the data themselves.

With something like using GPT to offer these additional descriptions, I really think that we should be thinking of these more as hypothesis generation exercises rather than asking for the answer. Part of that is GPT gets it wrong more frequently than we would like it to, and there's other work in our lab thinking about the ways in which it gets it wrong.

I was trying to articulate in the demo that situating that additional information within the data structure where you can hear that description but then go back and do the analysis yourself and decide whether or not you agree that the global financial crisis actually caused this dip in the data is powerful to leave in the user's hands.

**Arvind:** Great. I think we're out of time.

**Jonathan:** Awesome. Thanks a lot. This is fantastic.