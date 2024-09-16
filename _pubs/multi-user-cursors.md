---
title: Representing Real-Time Multi-User Collaboration in Visualizations
authors:
  - key: rneogy
  - key: jzong
    affiliation: MIT
  - key: arvindsatya
venue: vis-short
year: 2020
date: 2020-10-25
doi: 10.1109/VIS47514.2020.00036
pdf_url: /publications/multi-user-cursors.pdf
themes: [visualization]
---

### Abstract

Establishing common ground and maintaining shared awareness amongst participants is a key challenge in collaborative visualization. For real-time collaboration, existing work has primarily focused on synchronizing constituent visualizations — an approach that makes it difficult for users to work independently, or selectively attend to their collaborators’ activity. To address this gap, we introduce a design space for representing synchronous multi-user collaboration in visualizations defined by two orthogonal axes: _situatedness_, or whether collaborators’ interactions are overlaid on or shown outside of a user’s view, and _specificity_, or whether collaborators are depicted through abstract, generic representations or through specific means customized for the given visualization. We populate this design space with a variety of examples including generic and custom synchronized _cursors_, and _user legends_ that collect these cursors together or reproduce collaborators’ views as thumbnails. To build common ground, users can interact with these representations by _peeking_ to take a quick look at a collaborator’s view, _tracking_ to follow along with a collaborator in real-time, and _forking_ to independently explore the visualization based on a collaborator’s work. We present a reference implementation of a wrapper library that converts interactive Vega-Lite charts into collaborative visualizations. We find that our approach affords synchronous collaboration across an expressive range of visual designs and interaction techniques.
