---
layout: class
class_id: 4871
title: "Assignment 3: Non-Visual Design | INFO 4871"
description: "INFO 4871 Assignment 3"
---

[Assignments](../) / Assignment 3

# Assignment 3: Non-Visual Design

**Checkpoint Wednesday, October 21. Due Wednesday, October 28. Teams of two or three.**

Most screen reader interfaces on the internet, when they are accessible at all, are usually designed by retrofitting screen reader attributes onto an existing visual structure. In this assignment, you will design a non-visual interface from the ground up. The goal of this assignment is to think about usability from a non-visual perspective, and how to think about the affordances of speech and audio (which are not always the same as visual affordances).

## Recreating a shopping flow

Every team will build a non-visual interface for two pages within an online shopping flow. These pages are (1) a search results page (the list of products returned by a query such as "wireless headphones" or "running shoes"), and (2) a product detail page, which shows the full information for a selected product from the list of search results.

Pick your favorite real-world shopping website and run a search on it. Use the results / products listed and recreate that page in your non-visual prototype.

The search results should list products with metadata for each result, which could include things like: title, price, star rating, review count, delivery estimate, and badges such as "sponsored" or "best seller." Each result should open onto a product detail page, which might includes fields like: title, description, a variant selector for size or color, and a list of reviews.

Unless the site you chose has extremely good accessible design (in which case, you might learn more if you choose a different one), the default screen reader experience might be *technically* accessible yet still not a very good experience. For example, maybe you have to tab through all of the information in one search result before you can even get to the next one, even if you can tell from the title that it's not the product you're looking for.

This assignment asks you to design across three dimensions: structure, navigation, and description.

**Structure** — how information is grouped together into a hierarchy and organized into a format the screen reader can traverse

**Navigation** — the ways a user can move around in the structure, whether that's moving to adjacent content or jumping to important landmarks

**Description** — what information the screen reader announces at each location, in what order, and how concise or verbose it is

## Part 1: Prototype and Sketch

Before you implement anything, sketch your interface's structure, navigation, and description on paper. For example, you can draw a diagram of the structure, list out the keyboard interactions that define the navigation, and write a script for what gets announced at each location.

Consider these questions as you prototype:

### Structure

- What structure is the visual hierarchy conveying, and should the non-visual structure match it?
- How should information be grouped together? Are there multiple pieces of information that describe the same entity?
- What tasks might people be trying to accomplish using this interface?
    - Write down specific questions a real user would want answered: "Which of these ship by Friday?", "Is the blue one in stock in a medium?", "Which result has the most reviews?" Questions like "What does the page show?" do not count.

### Navigation

- From each location, where can the user go? And what key(s) do they press to get there?
- For the user task questions you wrote down in part 1, is there a way to answer all of them? Are some of them easier or harder to answer? (It's not always possible to make every task equally easy to accomplish.)
- How does a user jump between two places that are not adjacent, such as two results at opposite ends of the list?

### Description

- What gets described at each location, and in what order?
- What can a user request on demand instead of receiving automatically? (e.g. by expanding summary/detail for additional info)
- Is there anything you are deliberately leaving out of the non-visual version, and why?

## Part 2: Build

Implement the design as a web interface that you can test with a screen reader.

**At the October 21 checkpoint**, submit Parts 1 through 3 plus a running prototype that can be tested. The prototype does not have to be perfect or finished, but there should be a first complete draft of a structure, navigation, and description.

## Part 3: Test and revise

Give your user task questions and your interface to a classmate from another team. They will work through it with a screen reader and try to answer the questions. Write down which questions they were able to answer and which they could not answer (or answered incorrectly). Iterate on your prototype based on this feedback, and write down what you changed and why.

We will reserve some time for this in class.

## What to submit

1. **Design document** covering structure, navigation, and description
    - Include your sketches or early prototypes.
    - For each design dimension: what choices did you make and why? What alternatives did you consider and why did you reject them?
2. **Code**
3. **Test results and revision notes**, answering:
    - What was an interesting or unexpected moment during testing that you learned from?
    - What did you change about your prototype in response, and how does that change address what happened in testing?


## Rubric

This assignment is worth **10 points**, divided across the criteria below. Each criterion is graded from its full point value (excellent) down to 0 (not present), with partial credit in between.

| Criterion | Points | Description |
|---|---|---|
| **Structure** | 2 | Sketches and prototypes address structure, the user task questions are specific and answerable |
| **Navigation** | 2 | Navigation is fully specified in sketches and prototypes |
| **Description** | 2 | Descriptions are specified and choices about what to include in which order are justified |
| **Build** | 2 | Prototype runs and has enough detail for testing |
| **Testing and revision** | 2 | Written reflections and specific revisions from peer user testing |

---

Previous: [Assignment 2: Accessibility Auditing and Remediation](../a2/) · Next: [Final Project](../final/)
