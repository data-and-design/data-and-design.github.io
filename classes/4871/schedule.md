---
layout: class
class_id: 4871
nav_title: Schedule
nav_order: 2
title: "Schedule | INFO 4871"
description: Week-by-week schedule for INFO 4871 Design for Accessibility.
---

# Schedule

*This schedule is a living document. It might be updated during the semester. If anything changes, I will announce it in advance. Changes will always be intended to benefit students—for example, I will never move deadlines earlier.*

<a href="#" id="jump-to-week">Jump to current week</a>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const semesterStart = new Date('2026-08-24'); // Monday
  const semesterEnd = new Date('2026-12-04');
  const today = new Date();

  let currentWeek;

  if (today < semesterStart) {
    currentWeek = 1;
  } else if (today > semesterEnd) {
    currentWeek = 16;
  } else {
    // Weeks run Monday through Sunday, starting Mon Aug 24
    const daysSinceStart = Math.floor((today - semesterStart) / (1000 * 60 * 60 * 24));
    currentWeek = Math.min(Math.floor(daysSinceStart / 7) + 1, 15);
  }

  const jumpLink = document.getElementById('jump-to-week');
  jumpLink.href = '#week-' + currentWeek;
});
</script>

<h2 id="week-1">Week 1 — Introduction: All Tech is Assistive</h2>

### August 24 (Monday)

#### In class

- Astra Taylor, dir. **Judith Butler & Sunaura Taylor in conversation.** From *Examined Life*. 2008. <https://www.youtube.com/watch?v=k0HZaPkF6qE>.

### August 26 (Wednesday)

#### Readings

- Sara Hendren. **“All Technology Is Assistive: Six Design Rules on Disability.”** In *Making Things and Drawing Boundaries: Experiments in the Digital Humanities*, edited by Jentery Sayers. University of Minnesota Press, 2018. <https://dhdebates.gc.cuny.edu/read/untitled-aa1769f2-6c55-485a-81af-ea82cce86966/section/b22b7f2d-f386-4ec5-bcee-30591c0078ba>.

Optional (Grad student recommended):
- Mills, Mara. **“Technology.”** *Keywords for Disability Studies*, April 27, 2015.

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 2: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 3: [**Connector**](./reading-responses#connector)
    - Rotation 4: [**Design Translator**](./reading-responses#design-translator)
- Start of semester survey

<h2 id="week-2">Week 2 — Extending Capabilities, Not Fixing Deficits</h2>

### August 31 (Monday)

#### Readings
- Petrick, Elizabeth. **“The Computer as Prosthesis? Embodiment, Augmentation, and Disability.”** In *Abstractions and Embodiments: New Histories of Computing and Society*, edited by Janet Abbate and Stephanie Dick. 2022.

Optional:
- Douglas C. Engelbart. **Augmenting Human Intellect: A Conceptual Framework.** SRI Summary Report AFOSR-3223. Stanford Research Institute, 1962. <https://www.dougengelbart.org/pubs/augment-3906.html>

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 2: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 3: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 4: [**Connector**](./reading-responses#connector)

### September 2 (Wednesday)

#### In class — software studio

- Screen readers and keyboard navigation
- [Assignment 1](./assignments/a1/) assigned

<h2 id="week-3">Week 3 — Against Technoableism (Part 1)</h2>

### September 7 (Monday) — Labor Day

### September 9 (Wednesday)

#### Readings
- Shew, Ashley. **Chapter 1: Disabled Everything**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.
- Shew, Ashley. **Chapter 2: Disorientation**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.

#### Due
- [Assignment 1: Screen Reader Familiarization](./assignments/a1/)
- [Reading responses](./reading-responses)
    - Rotation 1: [**Connector**](./reading-responses#connector)
    - Rotation 2: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 3: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 4: [**Concept Keeper**](./reading-responses#concept-keeper)

<h2 id="week-4">Week 4 — Against Technoableism (Part 2)</h2>

### September 14 (Monday)

#### Readings
- Shew, Ashley. **Chapter 3: Scripts and Crips**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.
- Shew, Ashley. **Chapter 4: New Legs, Old Tricks**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 2: [**Connector**](./reading-responses#connector)
    - Rotation 3: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 4: [**Argument Analyst**](./reading-responses#argument-analyst)

### September 16 (Wednesday)

#### In class — software studio
- Semantic HTML and the accessibility tree
- [Assignment 2](./assignments/a2/) assigned

<h2 id="week-5">Week 5 — Against Technoableism (Part 3)</h2>

### September 21 (Monday)

#### Readings

- Shew, Ashley. **Chapter 5: The Neurodivergent Resistance**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.
- Shew, Ashley. **Chapter 6: Accessible Futures**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.

Optional (Grad student recommended):
- Garland-Thomson, Rosemarie. **"Conserving Disability and Constructing a Habitable World."** ABC Religion & Ethics, December 2, 2020. <https://www.abc.net.au/religion/rosemarie-garland-thomson-conserving-disability-and-constructin/12408108>.
- Kafer, Alison. **“Introduction: Imagined Futures.”** *Feminist, Queer, Crip*. Indiana University Press, 2013.

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 2: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 3: [**Connector**](./reading-responses#connector)
    - Rotation 4: [**Design Translator**](./reading-responses#design-translator)

### September 23 (Wednesday)

#### In class — software studio

- Automated accessibility testing with axe and pa11y
- WCAG 2.2 and conformance-based evaluation
- ARIA + focus management

<h2 id="week-6">Week 6 — Crip Technoscience: Disabled Knowing and Making</h2>

### September 28 (Monday)

#### Readings
- Hamraie, Aimi, and Kelly Fritsch. **"Crip Technoscience Manifesto."** *Catalyst: Feminism, Theory, Technoscience* 5, no. 1 (2019): 1. <https://catalystjournal.org/index.php/catalyst/article/view/29607/24772>.
    - If you are confused, read the accompanying talk transcript in Canvas

#### In class
- Guest Lecture: Sid Cook

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 2: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 3: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 4: [**Connector**](./reading-responses#connector)

### September 30 (Wednesday) — No Class

<h2 id="week-7">Week 7 — Posthumanism: Who is the "Human" in HCI?</h2>

### October 5 (Monday)

#### Readings
- Alice Wong and Ed Yong. **"What Counts as Seeing."**  *Orion Magazine*. July 12, 2022. <https://orionmagazine.org/article/ed-yong-alice-wong-interview/>.
- Weise, Jillian. **“Common Cyborg.”** *Granta*, September 24, 2018. <https://granta.com/common-cyborg/>.

Optional:
- Donna Haraway. **A Cyborg Manifesto: Science, Technology, and Socialist-Feminism in the Late Twentieth Century** In *Simians, Cyborgs and Women: The Reinvention of Nature*. 1985. <https://theanarchistlibrary.org/library/donna-haraway-a-cyborg-manifesto>
- Kafer, Alison. Chapter 5 **"The Cyborg and the Crip: Critical Encounters."** *Feminist, Queer, Crip*. Indiana University Press, 2013.
- Romanska, Magda. **“The Bionic Body: Disability, Technology and Posthumanism.”** Body, Space & Technology 23, no. 1 (2024). <https://doi.org/10.16995/bst.11480>.

#### In class
- Guest Lecture: Z Fisher

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Connector**](./reading-responses#connector)
    - Rotation 2: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 3: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 4: [**Concept Keeper**](./reading-responses#concept-keeper)

### October 7 (Wednesday) — No Class

<h2 id="week-8">Week 8 — Care, Interdependence, and the Myth of Autonomy</h2>

### October 12 (Monday)


#### Readings
- Mia Mingus. **"Access Intimacy, Interdependence and Disability Justice."** Leaving Evidence, April 12, 2017. <https://leavingevidence.wordpress.com/2017/04/12/access-intimacy-interdependence-and-disability-justice/>.

Optional (Grad student recommended):
- Bennett, Cynthia L., Erin Brady, and Stacy M. Branham. **"Interdependence as a Frame for Assistive Technology Research and Design."** *Proceedings of the 20th International ACM SIGACCESS Conference on Computers and Accessibility* (New York, NY, USA), ASSETS '18, Association for Computing Machinery, October 8, 2018, 161–73. <https://doi.org/10.1145/3234695.3236348>.


#### Due
- [Assignment 2: Accessibility Auditing and Remediation](./assignments/a2/)
- [Reading responses](./reading-responses)
    - Rotation 1: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 2: [**Connector**](./reading-responses#connector)
    - Rotation 3: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 4: [**Argument Analyst**](./reading-responses#argument-analyst)
- Mid-semester feedback survey

### October 14 (Wednesday)

#### In class — software studio

- [Design dimensions for non-visual interaction](vis.mit.edu/pubs/rich-screen-reader-vis-experiences)
- Accessible data visualization: [Olli](https://github.com/umwelt-data/olli) and [Umwelt](https://github.com/umwelt-data/umwelt)
- [Assignment 3](./assignments/a3/) assigned

<h2 id="week-9">Week 9 — Deafness, Language, and Culture</h2>

### October 19 (Monday)

#### Readings
- Erard, Michael. **"Why Sign-Language Gloves Don't Help Deaf People."** *The Atlantic*, November 9, 2017. <https://www.theatlantic.com/technology/archive/2017/11/why-sign-language-gloves-dont-help-deaf-people/545441/>.

Optional (Grad student recommended):
- Padden, Carol, and Tom Humphries. **Chapter 1: Learning to Be Deaf**. From *Deaf in America: Voices from a Culture*. Harvard University Press, 1988.

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 2: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 3: [**Connector**](./reading-responses#connector)
    - Rotation 4: [**Design Translator**](./reading-responses#design-translator)

### October 21 (Wednesday)

#### In class — software studio

- [Customization is Key](https://data-and-design.org/publications/customization/)
- Assignment 3 prototype swap

#### Due
- [Assignment 3 checkpoint](./assignments/a3/)

<h2 id="week-10">Week 10 — Life at the Limits of Language (Part 1)</h2>

### October 26 (Monday)

#### Readings
- Edwards, Terra. **Chapter 1: Life at the Limits of Language**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.
- Edwards, Terra. **Chapter 2: Creating DeafBlind Identity**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.

Optional:
- Davis, Jenny L. **“Introduction.”** from *How Artifacts Afford: The Power and Politics of Everyday Things.* Design Thinking, Design Theory, edited by Ken Friedman and Erik Stolterman. MIT Press, 2020.
- James J. Gibson. **"The Theory of Affordances."** In *The Ecological Approach to Visual Perception*. 1979. <https://cs.brown.edu/courses/cs137/2017/readings/Gibson-AFF.pdf>


#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 2: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 3: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 4: [**Connector**](./reading-responses#connector)

### October 28 (Wednesday)

#### In class — software studio

- Work time and group critique

#### Due
- [Assignment 3: Non-Visual Design](./assignments/a3/)
- [Final project teams](./assignments/final/#teams) entered in Canvas

<h2 id="week-11">Week 11 — Life at the Limits of Language (Part 2)</h2>

### November 2 (Monday)

#### Readings
- Edwards, Terra. **Chapter 3: The Collapse of the World**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Connector**](./reading-responses#connector)
    - Rotation 2: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 3: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 4: [**Concept Keeper**](./reading-responses#concept-keeper)

### November 4 (Wednesday)

#### In class

- Project check-ins / work time

#### Due
- [Final project proposal](./assignments/final/#proposal)

<h2 id="week-12">Week 12 — Life at the Limits of Language (Part 3)</h2>

### November 9 (Monday)

#### Readings
- Edwards, Terra. **Chapter 4: The Protactile Movement**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.

Optional (strongly recommended):
- Clark, John Lee. **"Against Access."** *McSweeney's Quarterly Concern 64: The Audio Issue*, October 2021. <https://audio.mcsweeneys.net/transcripts/against_access.html>.

#### In class
- Guest Lecture: [Blakeley H. Payne](https://www.blakeleyhpayne.com/)

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 2: [**Connector**](./reading-responses#connector)
    - Rotation 3: [**Design Translator**](./reading-responses#design-translator)
    - Rotation 4: [**Argument Analyst**](./reading-responses#argument-analyst)

### November 11 (Wednesday) — No Class

<h2 id="week-13">Week 13 — Disability, Bias, and AI</h2>

### November 16 (Monday)

#### Readings
- Whittaker, Meredith, Meryl Alper, Cynthia L. Bennett, Sara Hendren, Elizabeth Kaziunas, Mara Mills, Meredith Ringel Morris, Joy Lisi Rankin, Emily Rogers, Marcel Salas, and Sarah Myers West. **"Disability, Bias & AI Report."** AI Now Institute, November 20, 2019. <https://ainowinstitute.org/publications/disabilitybiasai-2019>

Optional:
- **"ASAN Says No Generative AI in Plain Language."** Autistic Self Advocacy Network, July 29, 2025. <https://autisticadvocacy.org/2025/07/asan-says-no-generative-ai-in-plain-language/>.

#### Due
- [Reading responses](./reading-responses)
    - Rotation 1: [**Argument Analyst**](./reading-responses#argument-analyst)
    - Rotation 2: [**Concept Keeper**](./reading-responses#concept-keeper)
    - Rotation 3: [**Connector**](./reading-responses#connector)
    - Rotation 4: [**Design Translator**](./reading-responses#design-translator)

### November 18 (Wednesday)

#### In class

- Project check-ins / work time

#### Due
- [Final project progress update](./assignments/final/#progress-update)

<h2 id="week-14">Week 14 — Fall Break</h2>

<h2 id="week-15">Week 15 — Final Project Presentations</h2>

### November 30 (Monday)

#### In class

- [Final Project Presentations](./assignments/final/#presentations)

### December 2 (Wednesday) — INFO Showcase

#### In class

- [Final Project Presentations](./assignments/final/#presentations)

### December 4 (Friday that is secretly a Monday)

#### In class

- [Final Project Presentations](./assignments/final/#presentations)

<h2 id="week-16">Week 16 — Finals Week</h2>

### Finals week (date TBD)

#### Due

- [Final project portfolio](./assignments/final/#portfolio)
