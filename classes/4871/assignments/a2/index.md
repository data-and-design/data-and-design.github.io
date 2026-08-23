---
layout: class
class_id: 4871
title: "Assignment 2: Accessibility Auditing and Remediation | INFO 4871"
description: "INFO 4871 Assignment 2"
---

[Assignments](../) / Assignment 2

# Assignment 2: Accessibility Auditing and Remediation

**Due Wednesday, October 7. Individually or in pairs.**

An important skill for accessibility professionals is to audit existing webpages for accessibility errors and understand how to fix them. In this assignment, you will conduct a basic accessibility audit of a practice website. The goal of this assignment is to get familiar with the tools and thought processes you would use as a UX engineer or accessibility specialist.

## The website

The practice site is a [five-screen ticket purchase flow](./practice-site/) for the fictional Foothills Repertory Theatre, seeded with a set of accessibility errors for you to find. The source is on [GitHub](https://github.com/data-and-design/info-4871-a2).

## Part 1: Run the audit

We will conduct an audit in multiple passes, first with automated tools and second with manual testing. Automated tools have limitations, so it's not possible to find every error if you only do the automated testing. Some errors will be found in the screen reader descriptions, others will appear when you operate the page from the keyboard, and others will only be apparent from reading the CSS, HTML, or Javascript source. I do not expect anyone to find every error.

If you are working in a pair, split the work between you and record who did what.

### Before you start

Get a local copy of the site and serve it at a `localhost` address, following steps 1 through 3 of [Running the automated checkers](#running-the-automated-checkers).

### Automated pass

Run two automated accessibility checkers over each of the five screens. The first checker is axe, which uses the testing engine found in most commercial accessibility products. The second is pa11y, which uses a different engine. Follow the instructions at [Running the automated checkers](#running-the-automated-checkers) to learn how to do this.

As you will see, the two checkers might produce conflicting results about the same page. Note where they disagree and why.

### Manual pass

Test the flow with a screen reader, test it with just keyboard inputs, and then choose two more passes from the list at the end of this section.

**With a screen reader.** Work through all five screens using the commands you learned in [Assignment 1](../a1/). Go through the following process:

- Read each screen from the top.
- List the headings, then move through them in order.
- List the links, and read that list without the surrounding page.
- List the landmarks or regions, and try to jump to the main content.
- Read any table cell by cell, and check whether the screen reader announces the row and column headers.
- Move through every form field and listen to what each field announces.
- Complete the purchase from end to end: choose a seat, fill in the checkout form, submit it, and arrive at the confirmation screen.

Write down any problems you find. Most will come from the difference between what's on screen and what gets read out loud.

**With keyboard input.**

- Load a screen fresh and press Tab once. Note what takes focus, and whether anything tells you where you are.
- Tab through the whole screen. Compare the order focus moves in against the order content appears in.
- Tab to every control and operate it. A control you can see but cannot reach by tabbing is an accessibility error, and a control you can reach but cannot operate is also an error.
- Open anything that pops up over the page, then try to leave it and return to where you started.
- Watch the focus indicator throughout. Note every place where you cannot tell what has focus.

**Then choose two of these,** and write down which two you chose in your report.

- **Read the source.** Open `styles.css`, `app.js`, and the five HTML files in a text editor. Compare the order elements appear in the markup against the order they appear on screen. Read what the CSS does to focus styles, element widths, positioning, and animation. Read what the JavaScript changes after the page loads, and work out whether anything announces those changes.
- **Validate the HTML.** Upload each of the five screens to the [W3C validator](https://validator.w3.org/#validate_by_upload). Invalid markup is not automatically an accessibility failure, so read each error and say which errors create usability problems for a user.
- **Errors and recovery.** Submit the checkout form with every field empty, then submit it again with an invalid card number. Each time, record what the site tells you, how it tells you, whether a screen reader user would learn that anything went wrong, and whether you lose what you already typed.
- **Zoom and reflow.** View each screen at 200% browser zoom and at 320 CSS pixels of width. Look for clipped content, lost content, and horizontal scrolling. You can also check overflow by using developer tools, which allow you to inspect element geometry.
- **Color contrast.** Read the computed foreground and background colors out of developer tools or the stylesheet, then run each pair through a contrast-ratio calculator. Compare against established guidelines for color contrast.

## Part 2: Repair what you found

Before you do anything, read the instructions at [Making the patch file](#making-the-patch-file). You will need to snapshot the original state of the code with git before you change anything, so that the patch will track your changes.

Repair at least five findings on your local copy. At least two of the five must come from your manual pass rather than from an automated checker's output.

Re-test after every repair, because sometimes repairs break other things.

Build the patch to submit, following the instructions in [Making the patch file](#making-the-patch-file).

## What to submit

Submit the following on Canvas.

### 1. Audit report

The audit report document should have the following sections.

**a. Method.** Document the screen reader, browser, and operating system you used. Also write down which two manual passes you chose. If you worked in a pair, write down who did which part.

**b. Findings.** One table, one row per finding, carrying a column for each of these:

- the location (which page, what element)
- the incorrect behavior (described with enough detail to reproduce it)
- how did you find it
- the WCAG 2.2 success criterion it violates, with that criterion's conformance level (or "none" if WCAG doesn't address the problem)
- did axe and/or pa11y catch it? (which one, or both, or neither)

**c. Priority ranking.** Rank the findings based on how severe they are for a user. How badly does each one prevent a user from finishing the purchase? Write a few sentences about the reasoning behind your ranking.

**d. Missed by the checkers.** What did you find that the automated checkers missed? For each one, explain why an automated tool cannot catch it.

**e. Missed by the standard.** What did you find that satisfies the WCAG criteria but is still a bad user experience? Reflect on the difference between compliance and usability.

**f. Remediation log.** Your five repairs. For each repair, write what you changed and why the change you chose addresses the problem.

### 2. Patch file

One `.patch` file carrying all your repairs, produced by following [Making the patch file](#making-the-patch-file).

## Running the automated checkers

Serve your local copy of the site at a `localhost` address and run both checkers on that address. This is necessary because browsers block extensions from reading pages opened straight from disk (i.e. from a `file://` address).

I recommend running each checker once well before the assignment is due. The first run downloads its own copy of Chrome, which takes several minutes and a few hundred megabytes. Later runs will start immediately.

### 1. Get the site

Clone the repository, or [download the ZIP](https://github.com/data-and-design/info-4871-a2) and unzip it.

```
git clone https://github.com/data-and-design/info-4871-a2.git
```

### 2. Install Node.js

Both checkers run on Node.js. macOS users should open Terminal. Windows users should open PowerShell. Then type:

```
node --version
```

A version number such as `v22.11.0` means Node is already installed, and you can go to step 3. `command not found` means Node is missing. Download the LTS installer from [nodejs.org](https://nodejs.org/), run it, quit the terminal, open the terminal again, and check the version again to confirm it's installed.

### 3. Start the server

`cd` to the directory the practice site is stored in. For example, if you cloned or unzipped the folder at `~/jzong/code/info-4871-a2`, then you should run:

```
cd ~/jzong/code/info-4871-a2
```

Tip: you can drag the folder from Finder or File Explorer onto the terminal window to paste the path to that folder.

Then start the server:

```
npx -y http-server
```

When you run the server, the terminal will print a couple of addresses and then stop printing, which means it is running and waiting for requests. Leave that terminal window open and untouched for as long as you are auditing, and press Ctrl-C in it when you finish to close the server.

Open a second terminal window for everything below, with Cmd-N on macOS or by starting PowerShell again on Windows. Check the server by visiting `http://localhost:8080` in a browser.

### 4. Run axe

Use either the extension or the command line.

**In the browser.** Install the axe DevTools extension for Chrome or Firefox. Open `http://localhost:8080/events.html`. Open developer tools with F12, or with Cmd-Option-I on macOS. Choose the axe DevTools tab and press "Scan all of my page".

**In the terminal.** Run this in your second terminal window:

```
npx -y @axe-core/cli http://localhost:8080/events.html
```

The command prints each broken rule, the number of elements that broke it, a CSS selector for each of those elements, and a link to Deque's writeup of the rule.

### 5. Run pa11y

```
npx -y pa11y http://localhost:8080/events.html
```

pa11y checks against WCAG level AA. For each error it prints the success criterion, a CSS selector, and the beginning of the offending HTML. The output uses pa11y's own notation, so `WCAG2AA.Principle1.Guideline1_4.1_4_3.G18.Fail` is success criterion 1.4.3, Contrast (Minimum).

### 6. Repeat for the whole flow

Swap `events.html` for `event.html`, `seats.html`, `checkout.html`, and `confirmation.html`, and run both checkers on each screen. Ten runs in total.

### 7. Save the output

Add `> filename.txt` to the end of a command to write its output into a file instead of onto the screen:

```
npx -y pa11y http://localhost:8080/seats.html > pa11y-seats.txt
```

Nothing prints when you do this, because the text went into the file. The file is saved in the terminal's current folder, which you can check with `pwd`.

### When something goes wrong

**`command not found: npx`.** You have not installed Node, or the terminal window was already open when you installed it. Quit the terminal, open it again, and redo step 2.

**`ECONNREFUSED`, or "connection refused".** The server from step 3 stopped, or it is running on a port other than the port in your command. Look at the first terminal window.

**The page loads and the extension reports nothing.** You opened the page from disk instead of from the server. If the address bar says `file://`, you should go back to `http://localhost:8080/`.

**The two checkers report different numbers.** Both lists are correct. Each checker finds things the other will miss, and reconciling the two lists is part of the audit.

## Making the patch file

A patch is a plain text file listing every line you changed. Produce it with git.

**1. Snapshot the site before you touch it.** Open a terminal in the folder holding the downloaded files and run:

```
git init
git add -A
git commit -m "Unmodified site"
```

If you cloned the repository you don't need to do this, so skip to step 2.

**2. Make your repairs.** Edit the HTML, CSS, and JavaScript as normal. Do not commit as you go. The snapshot from step 1 is the only commit you need.

**3. Read your changes back.**

```
git diff
```

Read the output before you go further. If it lists files you did not mean to touch, or shows every line of a file as changed, fix that now.

**4. Write the patch.**

```
git diff > ../lastname-a2.patch
```

Put your own last name in the filename. The `../` writes the patch to the folder above the site, so the patch stays out of the next patch you generate. Upload the `.patch` file to Canvas.

**5. Check that it applies correctly.** If you want to be sure that you created your patch correctly, copy the patch file and a fresh unmodified copy of the site into a scratch folder, then run:

```
git apply --check lastname-a2.patch
```

No output means the patch applies cleanly. An error message means the patch does not apply, which means I won't be able to grade it properly.

### When the patch comes out wrong

**It is empty.** You committed your repairs, so nothing remains in the working tree to diff. Run `git log --oneline`, find the "Unmodified site" commit, and use `git diff <that hash>` instead.

**Every line of a file shows as changed.** Your editor rewrote the line endings for the whole file. Set the editor to use LF, revert the file with `git checkout -- <filename>`, and redo the edit.

**It contains files you did not edit.** Git is tracking something it should not track: an editor config directory, a `.DS_Store`, or a downloaded copy of a page. Delete that file or add it to `.gitignore`, then regenerate the patch.

If git will not cooperate, ask in class or office hours before the deadline, or ask a classmate. Producing a readable diff takes five minutes once you have watched someone do it.

## Rubric

This assignment is worth **10 points**, divided across the criteria below. Each criterion is graded from its full point value (excellent) down to 0 (not present), with partial credit in between.

| Criterion | Points | Full marks |
|---|---|---|
| **Coverage** | 2 | The automated pass, the screen reader pass, the keyboard pass, and your two chosen passes, all run across all five screens. Every finding described specifically enough that it can be reproduced. |
| **WCAG mapping** | 2 | Every finding documents the success criterion it violates and that criterion's conformance level, cited correctly. Findings that no criterion covers are marked as uncovered rather than dropped. |
| **Prioritization** | 1 | Findings ranked by how much each one costs a user trying to finish the purchase, with reasoning that goes beyond a checker's severity rating. |
| **Missed failures** | 3 | Both lists populated with real cases. Each entry in the first list explains why no automated checker can catch it. Each entry in the second list relates to a limitation of conformance-based evaluations. |
| **Remediation** | 2 | Five repairs that work, at least two of them drawn from your manual pass, and none of them breaking other behavior that previously worked. |

---

Previous: [Assignment 1: Screen Reader Familiarization](../a1/) · Next: [Assignment 3: Non-Visual Design](../a3/)
