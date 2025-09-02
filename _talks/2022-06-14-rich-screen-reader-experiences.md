---
layout: talk
title: "Rich Screen Reader Experiences for Accessible Data Visualization"
author: jzong
youtube_url: https://www.youtube-nocookie.com/embed/oc4GQNM7tUw?si=nhV2l5Moce0a109u
themes: [access]
projects: [olli]
---

_This is the conference talk for [Rich Screen Reader Experiences for Accessible Data Visualization](https://data-and-design.org/publications/rich-screen-reader-vis-experiences/), which was presented at EuroVis 2022 and won Best Paper Honorable Mention._

## Introduction and Collaborators

Hi, my name is Jonathan Zong and I'm excited to present our work to you today on rich screen reader experiences for accessible data visualization. This work is the result of a collaboration between myself, Crystal Lee, Alan Lundgard, JiWoong Jang, Daniel Hajas, and Arvind Satyanarayan. I'm super grateful to be working with such an amazing team.

## The Scale of the Problem

In the United States, where I live, there are about seven million people with a visual disability according to the National Federation of the Blind. For them and for many more people globally, much of the web simply does not work. WebAIM conducted a study showing that 96.8% of the top million pages on the internet fail to conform to basic standards for making content accessible to screen reader assistive technology.

### How Screen Readers Work

If you're not familiar with how screen readers work, there's essentially a cursor which will be represented here visually using a black outline. The user can use keyboard shortcuts to move this cursor around the page, and whatever is selected by the cursor will be read out as text-to-speech.

Here I can demonstrate what the accessible HTML version of our paper looks like to a screen reader:

> "Visit link. Heading level one. Hi, we're the Visualization Group. Visit link. Home. Link. Link. Link. Heading level one. Rich screen reader experiences for accessible data visualization. Best paper honorable mention. Article. You are currently on article inside of web content. Heading level two. Two items. Abstract. Current accessibility guidelines ask visualization designers to support screen readers via basic non-visual alternatives like textual descriptions..."

But for the many people who primarily browse the web using screen readers, because most of the web is not designed for accessibility—and especially not visualization accessibility—the average experience of a screen reader user is more like what's shown in this video from Sarah Fossheim of reading a map using a screen reader:

> "Image. Image. Image. Image. Image. Image. Logo of a. Image."

## Current Best Practices and Their Limitations

Because this is such a huge, widespread problem, we're going to focus in this talk on this question: How do we make charts more accessible to screen reader users? I'll talk about what the current best practices are using this example map of U.S. election results from Sarah's video.

Current best practices suggest that charts include both alt text and a link to the underlying data table.

### Alt Text Limitations

The alt text for that map might be something like this:

> "Map of 2020 U.S. presidential election results. Joe Biden has 227 electoral votes. Donald Trump has 213 electoral votes. 98 votes remain."

Alt text is important to include, and it's certainly better than nothing, but where does it fall short?

1. **Single static interface** - I can't interact with this alt text to focus on different areas of the chart
2. **Lack of control over information granularity** - Biden has 227 electoral votes, but which states do these votes come from? We can answer this question with the chart, but an alt text that could answer this question would be unmanageably long
3. **Lack of agency in data analysis** - It's hard to formulate new questions about the data when the only information you have is from the alt text

### Data Table Limitations

Now let's consider data tables. Here's an example table that has the same information as that election visualization—data on votes in each state broken down by candidates.

Adding the table addresses some of the limitations of alt text by providing users with the agency to browse by row and column and ask their own questions. But it also introduces new limitations:

1. **Tables are tedious and time-consuming** - Even just reading every value in a table with hundreds of rows would take substantial effort
2. **Tables require high cognitive load** - What if I asked you to read this table and tell me the overall geographic trend of which states vote for which party? You'd probably want to break out a notepad
3. **Tables are missing a lot of what visualizations provide** - Remember, visualizations don't just summarize tables but also guide the reader through narratives and interpretations. If I asked you what story does this table tell, it'd be hard to say

### Current State-of-the-Art

Despite these shortcomings, remember that alt text and tables are still the current best practices. But could we do better using custom screen reader interfaces? 

A good example of a state-of-the-art screen reader visualization is this demo line chart from Highcharts. But as you'll see, we're still resorting to reading off individual data points like with a table:

> "1 December 2010, 34.8% NVDA. 1 December 2010, 20.2% VoiceOver. 2 May 2012, 30.7% VoiceOver. 3 January 2014..."

## Our Approach: Richer Screen Reader Experiences

How can we improve on current best practices? The main contribution we offer in our work is a set of design dimensions of richer screen reader experiences for visualization.

To show you how our thinking contrasts with current best practices, I'll start by showing a demo interface before we elaborate the framework. This is just meant to demonstrate one point in our design space—one example of a way to design richer screen reader interfaces.

### Demo: Penguin Scatterplot Interface

Here I have a demo of a scatterplot of penguin data. To a screen reader, our system represents this scatterplot as a keyboard-navigable data structure that contains text descriptions at varying levels of detail.

When a screen reader user first encounters this visualization on a page, they'll be able to read off a high-level alt text description of what the chart is:

> "A scatterplot showing body mass and flipper lengths of penguins."

If they're interested in getting more detail about this visualization, they can dive in by pressing the down arrow key to descend one level in the hierarchy and access descriptions about the different encodings of the scatterplot:

> "X-axis titled flipper length for linear scale with values from 170 to 240."

I can press the left and right arrow keys to flip through descriptions of the other axes and legends:

> "Y-axis titled body mass (g) for linear scale with values from 2,500 to 6,500."
> 
> "Legend titled species for color with three values: Adelie, Chinstrap, Gentoo."
> 
> "Grid view of scatterplot."

Let's say I am interested in getting more information about the x-axis. I can use the left arrow key to navigate back to the x-axis description and then press down one more time to descend a level of detail into the x-axis:

> "For the range 220-230, 35 data values in the interval."

On this level underneath the x-axis, I'm accessing descriptions of intervals along the x-axis, and it's reading out to me how many data values are contained within each interval. By pressing left and right, I can get a sense of the distribution of data along the x-axis:

> "Range 190-200: 113 data values in the interval."

Let's say I am interested in this range from 190 to 200. I can then press the down arrow again to dive into the individual data points that are contained within this interval:

> "1 of 113: flipper length 190mm, body mass 3,650g, species Adelie."

#### Spatial Navigation

Instead of moving up and down this hierarchical structure, I might rather just move around the x/y grid in the scatterplot as if I were feeling around a tactile graphic, for example. I can start by navigating over to the grid view of the scatterplot, and once I descend into this part of the hierarchy, I can use the WASD keys to move up and down different squares along the grid.

Similarly to before, it's starting off by giving me the number of data values that are contained in that square so that I can get a sense of the distribution of the data.

#### Targeted Navigation

Finally, what if I'm looking for a specific data point and I understand what the value is but don't want to necessarily use my arrow keys to figure out how to path there on the hierarchy? I can press the R key in this demo to bring up a menu of dropdown items that list off all the different locations in the hierarchical structure:

> "Opened navigation menu. Use dropdown to navigate."

With the screen reader, I can use these dropdowns to select a location in the visualization that I want to go to and jump immediately there.

### Key Differences from Prior Art

I want to call attention to a few key differences between what I just showed and the prior state of the art:

1. **Hierarchical structure** - Rather than going through a list of descriptions, people could optionally dive into certain entries for more detail
2. **Multiple ways to navigate** - Not just to adjacent parts of the hierarchy but also spatially and by jumping to a target location
3. **Varied levels of information granularity** - From high-level overviews to summaries of intervals to individual data values

## Design Process and Methodology

Building on these ideas, I want to talk about how we developed our design dimensions to help us think systematically about designing accessible visualizations for screen readers.

### Participatory Design Approach

Our prototypes and design dimensions come from an iterative design process with our blind co-author Daniel. In working through our process, we wanted to be thoughtful about the stakes of calling a design process participatory or inclusive. There's a long history of extractive and exploitative research with disabled people, particularly when it comes to the development of new technologies. After all, research about disability and technology doesn't automatically become inclusive when there's an author with a marginalized identity.

For us to do this work thoughtfully and with care meant seeking to substantively engage with disability studies literature and prioritizing Daniel's expertise as a blind HCI researcher. This led to a six-month design process where we discussed sketches and prototypes, and throughout the process we kept a written archive of feedback and notes from Daniel that other authors used to iteratively inform our design process and our prototypes.

We ultimately created 15 prototype design explorations to illuminate different points in our design space. Through our long process of prototyping, iteration, and reflection, we continually refined a framework for characterizing screen reader experiences for visualization in terms of three dimensions: **structure**, **navigation**, and **description**.

## Framework: Three Design Dimensions

I'm going to walk through our framework one dimension at a time.

### 1. Structure

Structure refers to an underlying representation of a visualization that organizes data and visual elements into a format that can be traversed by a screen reader. When we think about designing the data structure to represent a visualization, there are two important considerations which we call **form** and **entities**.

#### Form: Shape of the Data Structure

First is form, which is concerned with the shape of the data structure. Consider a completely linear example structure which represents a visualization as a sequential list of descriptions:

> "Colored scatterplot. A scatterplot showing body mass and flipper lengths of penguins. X-axis titled flipper length for linear scale with value... Y-axis title body mass (g) for linear scale with values from... flipper lengths..."

That's the current out-of-the-box screen reader experience for a Vega chart right now, and you'll notice that you immediately get to a list of every data point that you have to sift through linearly one at a time.

In contrast, the prototype I showed earlier has a hierarchical structure so you can go through the list of axes, for example, and dive into one of them if you want to. But if you don't, you don't need to linearly go through all the x-axis descriptions to get to the y-axis descriptions.

#### Entities: What Nodes Represent

The second consideration for structure is choosing what entities the nodes in the structure represent. We explored some different options in our prototypes:

- **Data intervals** - We made a line chart where all the nodes were mapped to data intervals, essentially as a binary search tree over the data
- **Encodings** - Using axes and legends, which is how the demo I showed earlier works
- **Author-defined annotations** - Building structures using annotations like notable regions highlighted in the x-axis

### 2. Navigation

Navigation refers to how a user moves around a structure. We identified three types:

#### Structural Navigation
The most common way to navigate is along the structure itself. We call this structural navigation, and it's what the arrow keys do in our prototypes. You're moving up and down the hierarchical structure and left to right along levels of the hierarchy.

#### Spatial Navigation
Spatial navigation involves moving horizontally and vertically in the x/y grid of the screen even if these elements aren't adjacent in the structural representation. You might want to do this to draw a spatial metaphor between the chart and something like a tactile graphic or be able to use spatial terms to communicate with someone who's sighted and is reading the same chart. Earlier in the demo we showed this using the WASD keys.

#### Targeted Navigation
Targeted navigation is about jumping directly to a known location without having to path there in the structure. We showed this in the demo using the dropdown menus of all the locations.

### 3. Description

With description, we're thinking about the actual narration of the data read out by the screen reader. There are three important things to consider when designing descriptions:

#### Semantic Content
Following Lundgard and Satyanarayan's framework, are we describing:
- **Level 1 elements** like encoding channels
- **Level 2 statistical summaries**
- **Level 3 patterns and trends**
- **Level 4 context-specific information**

#### Composition
Composition considers things like the ordering of the information in the description. When a screen reader user is flipping through hundreds of data points, we want the important information to be up front so that they can quickly listen to the first part of the description and then skip the rest if it's irrelevant.

#### Verbosity
It's important to consider what amount of information is relevant to the user. For example, a user less familiar with our system might prefer a more verbose description like:

> "Interval with 6 values in the range 20 to 30."

On the other hand, a power user who wants to save time might prefer a terse description like:

> "6 values, 20 to 30."

## Example Gallery

Our paper and supplemental materials include an example gallery that highlights our design dimensions applied to a diverse range of chart types.

## User Evaluation

For our user evaluation, we conducted a mixed-method study with 13 blind and low-vision participants where we interviewed users about their past experiences with visualizations and walked them through three prototypes.

### Positive Feedback

One user told us that they liked the ability to scroll through at a higher level and then drill down deeper if that's of interest. In this case, the system helped them selectively attend to different parts of the visualization, analogously to what sighted people do perceptually.

Another user told us that it gave them different ways of thinking—they were thinking in more spatial terms. Our system afforded a different mental model of the data and helped users understand the same spatial metaphor that sighted users also use to talk about data.

### Challenges: Learnability

But another participant raised an important point about learnability. They said:

> "I suspect that this might be understandable to someone who's done this before. I don't do well with these charts unless they're converted back into tables."

Because our system was unfamiliar, they still found it important to fall back on their existing workflow with tables.

## Future Directions

That last bit of insight leads us to think about what comes next for this work.

### Standardization and Toolkits

In working to make visualizations more accessible on the web, we've observed that most accessible visualizations are ad-hoc implementations. These take a lot of time to build and lack shared UX conventions. That's why it's important that toolkits like Highcharts and Vega provide accessible experiences by default. Then authors can focus on customizing that experience and focus on storytelling, and users can learn a standardized user experience that they can bring with them from chart to chart.

Our team is working with Matt Blanco, an amazing undergraduate researcher, to make it easier for developers to make existing visualizations accessible. Here's a preview of Matt's work taking an existing Vega-Lite spec and automatically generating a screen reader accessible structure in a few lines of code.

### Research Directions

Finally, I'd like to leave off with some prompts for future work that our design dimensions can facilitate:

#### Composing Different Modalities
You can imagine thinking about structure and navigation for not only language descriptions, but also sonification and tactile displays. This would pose new questions about what levels of semantic content mean for sonification, for example.

#### Accessible Interaction Techniques
How do we think about interaction techniques like view respecification or custom data queries as a different kind of operation from simply navigating around a static chart? This could imply the need for dynamic structures or descriptions.

#### Accessible Visualization Authoring
How do screen reader users not only consume visualizations but also produce their own? Answering this question might suggest different trade-offs in the design of visualization grammars and UIs in terms of higher-level abstractions for hierarchy and structure, for example.

## Conclusion

With that, I'm grateful for your attention and look forward to the discussions I hope our work will spark. You can find the accessible HTML version of our paper on our website [vis.mit.edu](https://vis.mit.edu/pubs/rich-screen-reader-vis-experiences/)—link is in the slide.

Thank you very much.