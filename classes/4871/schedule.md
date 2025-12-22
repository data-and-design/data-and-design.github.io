---
layout: class
class_id: 4871
nav_title: Schedule
nav_order: 2
title: Schedule | INFO 4871
description: Week-by-week schedule for INFO 4871 including readings on disability studies, accessibility, crip technoscience, and participatory design methods.
---

# Schedule

*This schedule is a living document. It might be updated during the semester. If anything changes, I will announce it in advance. Changes will always be intended to benefit students—for example, I will never move deadlines earlier.*

<a href="#" id="jump-to-week">Jump to current week</a>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const semesterStart = new Date('2026-01-08'); // Thursday
  const semesterEnd = new Date('2026-04-23');
  const today = new Date();

  let currentWeek;

  if (today < semesterStart) {
    currentWeek = 1;
  } else if (today > semesterEnd) {
    currentWeek = 16;
  } else {
    const daysSinceStart = Math.floor((today - semesterStart) / (1000 * 60 * 60 * 24));

    if (daysSinceStart < 4) {
      // Week 1: Thu Jan 8 - Sun Jan 11 (days 0-3)
      currentWeek = 1;
    } else {
      // Week 2+: Mon Jan 12 onwards, weeks turn over on Sunday
      const daysAfterWeek1 = daysSinceStart - 4;
      currentWeek = Math.min(Math.floor(daysAfterWeek1 / 7) + 2, 16);
    }
  }

  const jumpLink = document.getElementById('jump-to-week');
  jumpLink.href = '#week-' + currentWeek;
});
</script>

<h2 id="week-1">Week 1 — Introduction: All Tech is Assistive</h2>

### January 8 (Thursday)

#### In class

- Astra Taylor, dir. **Judith Butler & Sunaura Taylor in conversation.** From *Examined Life*. 2008. <https://www.youtube.com/watch?v=k0HZaPkF6qE>.

<h2 id="week-2">Week 2 — Extending Capabilities, Not Fixing Deficits</h2>

### January 13 (Tuesday)

#### Readings

- Sara Hendren. **“All Technology Is Assistive: Six Design Rules on Disability.”** In *Making Things and Drawing Boundaries: Experiments in the Digital Humanities*, edited by Jentery Sayers. University of Minnesota Press, 2018. <https://dhdebates.gc.cuny.edu/read/untitled-aa1769f2-6c55-485a-81af-ea82cce86966/section/b22b7f2d-f386-4ec5-bcee-30591c0078ba>.
- Mills, Mara. **“Technology.”** *Keywords*, April 27, 2015.

#### Due
- [Reading responses](./assignments)

### January 15 (Thursday)

#### Readings
- Petrick, Elizabeth. **“The Computer as Prosthesis? Embodiment, Augmentation, and Disability.”** In *Abstractions and Embodiments: New Histories of Computing and Society*, edited by Janet Abbate and Stephanie Dick. 2022.

Optional:
- Douglas C. Engelbart. **Augmenting Human Intellect: A Conceptual Framework.** SRI Summary Report AFOSR-3223. Stanford Research Institute, 1962. <https://www.dougengelbart.org/pubs/augment-3906.html>

#### Due
- [Reading responses](./assignments)

<h2 id="week-3">Week 3 — Against Technoableism (Part 1)</h2>

### January 20 (Tuesday)

#### Readings
- Shew, Ashley. **Chapter 1: Disabled Everything**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.
- Shew, Ashley. **Chapter 2: Disorientation**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.

#### Due
- [Reading responses](./assignments)


### January 22 (Thursday)

#### Readings
- Shew, Ashley. **Chapter 3: Scripts and Crips**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.
- Shew, Ashley. **Chapter 4: New Legs, Old Tricks**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.

#### Due
- [Reading responses](./assignments)


<h2 id="week-4">Week 4 — Against Technoableism (Part 2)</h2>

### January 27 (Tuesday) — Class on Zoom

#### Readings

- Shew, Ashley. **Chapter 5: The Neurodivergent Resistance**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.
- Shew, Ashley. **Chapter 6: Accessible Futures**. From *Against Technoableism: Rethinking Who Needs Improvement.* Norton Shorts. W.W. Norton & Company, 2023.


#### Due
- [Reading responses](./assignments)


### January 29 (Thursday) — Class on Zoom

#### Readings
- Winner, Langdon. **“Do Artifacts Have Politics?”** Daedalus 109, no. 1 (1980): 121–36.

#### Due
- [Reading responses](./assignments)
- [Milestone 1: Team Composition](./final-project.html#milestone-1)

<h2 id="week-5">Week 5 — Disability Futures</h2>

### February 3 (Tuesday)

#### Readings

- Kafer, Alison. **“Introduction: Imagined Futures.”** *Feminist, Queer, Crip*. Indiana University Press, 2013.

- Garland-Thomson, Rosemarie. **“Conserving Disability and Constructing a Habitable World.”** ABC Religion & Ethics, December 2, 2020. <https://www.abc.net.au/religion/rosemarie-garland-thomson-conserving-disability-and-constructin/12408108>.


#### Due
- [Reading responses](./assignments)

### February 5 (Thursday)

#### Readings
- Angelini, Robin, Katta Spiel, and Maartje De Meulder. **“Speculating Deaf Tech: Reimagining Technologies Centering Deaf People.”** Proceedings of the 2025 CHI Conference on Human Factors in Computing Systems (New York, NY, USA), CHI ’25, Association for Computing Machinery, April 25, 2025, 1–18. <https://doi.org/10.1145/3706598.3713238>.


#### Due
- [Reading responses](./assignments)
- [Milestone 2: Define a Project](./final-project.html#milestone-2)

<h2 id="week-6">Week 6 — Crip Technoscience: Disabled Knowing and Making</h2>

### February 10 (Tuesday)

#### Readings
- Hamraie, Aimi, and Kelly Fritsch. **“Crip Technoscience Manifesto.”** *Catalyst: Feminism, Theory, Technoscience* 5, no. 1 (2019): 1. <https://catalystjournal.org/index.php/catalyst/article/view/29607/24772>.


#### Due
- [Reading responses](./assignments)


### February 12 (Thursday)

#### Readings

- Brody, Miriam, Izabella Rodrigues, Jane L. E, and Jingyi Li. **“Expanding Norms, Negotiating Bodies: How Artists with Disabilities Perceive and Use Creative Tools.”** *Proceedings of the 27th International ACM SIGACCESS Conference on Computers and Accessibility* (New York, NY, USA), ASSETS ’25, Association for Computing Machinery, October 22, 2025, 1–14. <https://doi.org/10.1145/3663547.3746331>.


#### Due
- [Reading responses](./assignments)
- [Milestone 3: Make a Plan](./final-project.html#milestone-3)


<h2 id="week-7">Week 7 — Common Cyborg</h2>

### February 17 (Tuesday)

#### Readings
- Weise, Jillian. **“Common Cyborg.”** *Granta*, September 24, 2018. <https://granta.com/common-cyborg/>.
- Kafer, Alison. Chapter 5 **“The Cyborg and the Crip: Critical Encounters.”** *Feminist, Queer, Crip*. Indiana University Press, 2013.

#### Due
- [Reading responses](./assignments)

### February 19 (Thursday)


#### Readings
- Hollan, James, Edwin Hutchins, and David Kirsh. **“Distributed Cognition: Toward a New Foundation for Human-Computer Interaction Research.”** *ACM Trans. Comput.-Hum. Interact.* (New York, NY, USA) 7, no. 2 (2000): 174–96. <https://doi.org/10.1145/353485.353487>.


#### Due
- [Reading responses](./assignments)
- [Milestone 4: Present in Class](./final-project.html#milestone-4)


<h2 id="week-8">Week 8 — Posthumanism: Who is the "Human" in HCI?</h2>

### February 24 (Tuesday)

#### Readings
- Romanska, Magda. **“The Bionic Body: Disability, Technology and Posthumanism.”** Body, Space & Technology 23, no. 1 (2024). <https://doi.org/10.16995/bst.11480>.
- Alice Wong and Ed Yong. **“What Counts as Seeing.”**  *Orion Magazine*. July 12, 2022. <https://orionmagazine.org/article/ed-yong-alice-wong-interview/>.


#### Due
- [Reading responses](./assignments)


### February 26 (Thursday) — Reading day


<h2 id="week-9">Week 9 — Care, Interdependence, and the Myth of Autonomy</h2>

### March 3 (Tuesday)

#### Readings
- Mia Mingus. **“Access Intimacy, Interdependence and Disability Justice.”** Leaving Evidence, April 12, 2017. <https://leavingevidence.wordpress.com/2017/04/12/access-intimacy-interdependence-and-disability-justice/>.


#### Due
- [Reading responses](./assignments)


### March 5 (Thursday)

#### Readings
- Bennett, Cynthia L., Erin Brady, and Stacy M. Branham. **“Interdependence as a Frame for Assistive Technology Research and Design.”** *Proceedings of the 20th International ACM SIGACCESS Conference on Computers and Accessibility* (New York, NY, USA), ASSETS ’18, Association for Computing Machinery, October 8, 2018, 161–73. <https://doi.org/10.1145/3234695.3236348>.

#### Due
- [Reading responses](./assignments)
- [Milestone 5: Weekly Update](./final-project.html#weekly-updates)

<h2 id="week-10">Week 10 — Disability and the Arts</h2>

### March 10 (Tuesday)

#### Readings
- Finnegan Shannon. **“Do You Want Us Here or Not, 2018–Ongoing.”** Finnegan Shannon, 2018. <https://shannonfinnegan.com/do-you-want-us-here-or-not>.
- Godin, M. Leona. **“Iconic Photographs of Blind People Prove Seeing Isn’t Knowing.”** ARTnews.Com, November 27, 2025. <https://www.artnews.com/art-in-america/features/blindness-photography-paul-strand-walker-evans-jacob-riis-1234763708/>.


#### Due
- [Reading responses](./assignments)


### March 12 (Thursday)

#### Readings
- Mills, Mara. **“HOLDING THE LINE: On the Art of Christine Sun Kim.”** Artforum, April 1, 2025. <https://www.artforum.com/features/christine-sun-kim-mara-mills-whitney-museum-review-1234728306/>.


#### Due
- [Reading responses](./assignments)
- [Milestone 6: Weekly Update](./final-project.html#weekly-updates)

<h2 id="week-11">Week 11 — Spring Break</h2>


<h2 id="week-12">Week 12 — Life at the Limits of Language (Part 1)</h2>

### March 24 (Tuesday)

#### Readings
- Edwards, Terra. **Chapter 1: Life at the Limits of Language**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.
- Edwards, Terra. **Chapter 2: Creating DeafBlind Identity**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.

#### Due
- [Reading responses](./assignments)


### March 26 (Thursday)

#### Readings
- Davis, Jenny L. **“Introduction.”** from *How Artifacts Afford: The Power and Politics of Everyday Things.* Design Thinking, Design Theory, edited by Ken Friedman and Erik Stolterman. MIT Press, 2020.

Optional:
- James J. Gibson. **“The Theory of Affordances.”** In *The Ecological Approach to Visual Perception*. 1979. <https://cs.brown.edu/courses/cs137/2017/readings/Gibson-AFF.pdf>

#### Due
- [Reading responses](./assignments)
- [Milestone 7: Weekly Update](./final-project.html#weekly-updates)

<h2 id="week-13">Week 13 — Life at the Limits of Language (Part 2)</h2>

### March 31 (Tuesday)


#### Readings
- Edwards, Terra. **Chapter 3: The Collapse of the World**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.
- Edwards, Terra. **Chapter 4: The Protactile Movement**. *Going Tactile: Life at the Limits of Language*. Oxford University Press, 2024.

#### Due
- [Reading responses](./assignments)

### April 2 (Thursday)

#### Readings
- Clark, John Lee. **“Against Access.”** *McSweeney’s Quarterly Concern 64: The Audio Issue*, October 2021. <https://audio.mcsweeneys.net/transcripts/against_access.html>.



#### Due
- [Reading responses](./assignments)
- [Milestone 8: Weekly Update](./final-project.html#weekly-updates)

<h2 id="week-14">Week 14 — Disability, Bias, and AI</h2>

### April 7 (Tuesday)

#### Readings
- Whittaker, Meredith, Meryl Alper, Cynthia L. Bennett, Sara Hendren, Elizabeth Kaziunas, Mara Mills, Meredith Ringel Morris, Joy Lisi Rankin, Emily Rogers, Marcel Salas, and Sarah Myers West. **“Disability, Bias & AI Report.”** AI Now Institute, November 20, 2019. <https://ainowinstitute.org/publications/disabilitybiasai-2019>



#### Due
- [Reading responses](./assignments)


### April 9 (Thursday)

#### Readings
- Vinitha Gadiraju, Shaun Kane, Sunipa Dev, Alex Taylor, Ding Wang, Remi Denton, and Robin Brewer. **“‘I Wouldn’t Say Offensive but...’: Disability-Centered Perspectives on Large Language Models.”** *ACM Conference on Fairness Accountability and Transparency*, ACM, June 12, 2023, 205–16. <https://doi.org/10.1145/3593013.3593989>.
- **“ASAN Says No Generative AI in Plain Language.”** Autistic Self Advocacy Network, July 29, 2025. <https://autisticadvocacy.org/2025/07/asan-says-no-generative-ai-in-plain-language/>.



#### Due
- [Reading responses](./assignments)
- [Milestone 9: Weekly Update](./final-project.html#weekly-updates)


<h2 id="week-15">Week 15 — Sociotechnical Considerations for Design</h2>

### April 14 (Tuesday)

#### Readings
- Lundgard, Alan, Crystal Lee, and Arvind Satyanarayan. **“Sociotechnical Considerations for Accessible Visualization Design.”** 2019 IEEE Visualization Conference (VIS), October 2019, 16–20. <https://doi.org/10.1109/VISUAL.2019.8933762>.


#### Due
- [Reading responses](./assignments)


### April 16 (Thursday)

#### Readings
- Zong, Jonathan, Crystal Lee, Alan Lundgard, JiWoong Jang, Daniel Hajas, and Arvind Satyanarayan. **“Rich Screen Reader Experiences for Accessible Data Visualization.”** Computer Graphics Forum, 2022. <https://vis.mit.edu/pubs/rich-screen-reader-vis-experiences/>.

#### Due
- [Reading responses](./assignments)
- [Milestone 10: Weekly Update](./final-project.html#weekly-updates)


<h2 id="week-16">Week 16 — Final Project Presentations</h2>

### April 21 (Tuesday)

#### In class

- Final Project Presentations

### April 23 (Thursday)

#### In class

- Final Project Presentations

#### Due

- Final Project Report