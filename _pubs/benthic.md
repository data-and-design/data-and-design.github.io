---
title: "Benthic: Perceptually Congruent Structures for Accessible Charts and Diagrams"
authors:
  - name: Catherine Mei
    affiliation: MIT
    equal: true
  - key: jopo
    equal: true
  - key: dhajas
  - key: jzong
    affiliation: MIT
  - key: arvindsatya
venue: assets
# doi: 10.1111/cgf.14519
year: 2025
date: 2025-10-27
pdf_url: /publications/benthic.pdf
# html_url: https://vis.csail.mit.edu/pubs/rich-screen-reader-vis-experiences/
themes: [access]
# projects: [olli]
---

Graphical representations—such as charts and diagrams—have a visual structure that communicates the relationship between visual elements. For instance, we might consider two elements to be connected when there is a line or arrow between them, or for there to be a part-to-whole relationship when one element is contained within the other. Yet, existing screen reader solutions rarely surface this structure for blind and low-vision readers. Recent approaches explore hierarchical trees or adjacency graphs, but these structures capture only parts of the visual structure—containment or direct connections, respectively. In response, we present Benthic, a system that supports perceptually congruent screen reader structures, which align screen reader navigation with a graphic’s visual structure. Benthic models graphical representations as hypergraphs: a relaxed tree structure that allows a single hyperedge to connect a parent to a set of children nodes. In doing so, Benthic is able to capture both hierarchical and adjacent visual relationships in a manner that is domain-agnostic and enables fluid (i.e., concise and reversible) traversal. To evaluate Benthic, we conducted a study with 15 blind participants who were asked to explore two kinds of graphical representations that have previously been studied with sighted readers. We find that Benthic’s perceptual congruence enabled flexible, goal-driven exploration and supported participants in building a clear understanding of each diagram’s structure.

