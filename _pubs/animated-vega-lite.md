---
title: 'Animated Vega-Lite: Unifying Animation with a Grammar of Interactive Graphics'
authors:
  - key: jzong
    equal: true
    affiliation: MIT
  - key: jopo
    equal: true
  - key: dwootton
  - key: arvindsatya
venue: vis-full
year: 2023
doi: 10.1109/TVCG.2022.3209369
pdf_url: /publications/animated-vega-lite.pdf
html_url: https://vis.csail.mit.edu/pubs/animated-vega-lite/
themes: [visualization]
projects: [animated-vega-lite]
materials:
  - name: Animated Vega-Lite Editor
    url: https://vis.csail.mit.edu/pubs/animated-vega-lite/editor/#/url/vega-lite/N4IgJghgLhIFygK4CcA28QAspQA4Gc4B6I5CAdwDoBzASyk0QCNF8BTZAYwHsA7KNv0o8AtkQBubahAlSIAWkgx2UfERER8A5ESUzpuEbV5gOlAFb4+IAL4AaEBuQBrDLm7GoIB7ghkR+PAA2qC8ECJsGACebH7eIOyobJxeCCBQUbiRcCDunvHWOVC0Eci2DkzGYPCgxriIqSBkvNSRDka88ACMAJwArH3tEAAe8ABMAAwTgwkCuPB9NjYAug5QzfgAZtzIIsGgm7So2jW5fuHRsWVLqyCCPGDG1Kc8qDunh2yo1Tk8iPzIKLxJKtEzwXiIVCoewgUZpT7fDCbDjFVD0IFrTLZEAAR0QEH49GgtEk5RAQPhtC+PxAaORAH02MMsil4hkshg8QTijBiqSYcUIh8qYicjE4g58JwIElTs1WsEJnY+lMJssYc42BSDiKaX8AUClksgA
---

### Abstract

We present Animated Vega-Lite, a set of extensions to Vega-Lite that model animated visualizations as time-varying data queries. In contrast to alternate approaches for specifying animated visualizations, which prize a highly expressive design space, Animated Vega-Lite prioritizes unifying animation with the language’s existing abstractions for static and interactive visualizations to enable authors to smoothly move between or combine these modalities. Thus, to compose animation with static visualizations, we represent time as an _encoding channel_. Time encodings map a data field to animation keyframes, providing a lightweight specification for animations without interaction. To compose animation and interaction, we also represent time as an _event stream_; Vega-Lite selections, which provide dynamic data queries, are now driven not only by input events but by timer ticks as well. We evaluate the expressiveness of our approach through a gallery of diverse examples that demonstrate coverage over taxonomies of both interaction and animation. We also critically reflect on the conceptual affordances and limitations of our contribution by interviewing five expert developers of existing animation grammars. These reflections highlight the key motivating role of in-the-wild examples, and identify three central tradeoffs: the language design process, the types of animated transitions supported, and how the systems model keyframes.
