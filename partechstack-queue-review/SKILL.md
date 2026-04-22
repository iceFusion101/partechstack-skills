---
name: partechstack-queue-review
description: Review the partechstack publishing queue in Notion and recommend three articles for the next edition.
when_to_use: |
  Trigger when Pat says "review the queue," "what should we publish next," "pick three articles,"
  "suggest articles for partechstack," "what's ready to publish," "queue review," or any variation of
  selecting articles from the partechstack queue. Also trigger when Pat mentions choosing, picking,
  or prioritizing partechstack content, reviewing what's in the pipeline, or planning the next edition.
allowed-tools: mcp__claude_ai_Notion__notion-query-database-view, WebFetch
---

# partechstack Queue Review

Review the partechstack publishing queue and recommend three articles for the next edition. This is a focused editorial triage session: pull the queue, read the source material, assess each candidate, and present a ranked shortlist with rationale.

## Context

partechstack is a partner technology news publication. It covers product launches, feature updates, integrations, and capability changes that affect partner team workflows. The audience is partnership professionals, partner managers, partner ops, alliances leaders, RevOps, and ISV/SI leaders.

The editorial filter is simple: every article must answer at least two of these four questions clearly:

1. What changed? (a specific product or capability, not vague "innovation")
2. Who does it affect? (which roles or team functions)
3. What motion does it serve? (co-sell, co-market, recruit, enable, marketplace, ops, etc.)
4. Why is it notable right now? (timing, competitive context, trend)

If a source article cannot answer at least two of these, it is not a strong candidate regardless of how recent it is.

## Workflow

### Step 1: Pull the Publishing Queue

Query the partechstack Publishing Queue view. This view is pre-filtered and pre-sorted.

```
Use notion-query-database-view with:
- view_url: "https://www.notion.so/5a6fc95e449542e3a691eca47818f07c?v=1a7bd15fa27180d89aea000cfa8566fc"
```

This returns articles with statuses in the To-do group (Not started, Review) and In progress group (On Hold, In progress, Ready to Publish, Sent to Ghost), sorted by Status descending then Queue Date descending.

Include articles that are On Hold, Review, or In progress in the evaluation. These are all valid candidates.

### Step 2: Build the Candidate List

From the query results, build a working list of all candidates. For each, note:

- Title
- Status
- Queue Date
- Article Date (if present)
- Original Link
- Account Name (if present)
- Topics (if tagged)
- Notes (if present)

Exclude any articles that already have a partechstack URL populated (they have already been published). Also exclude articles with Status "Sent to Ghost" or "Ready to Publish" since those are already in the publishing pipeline.

### Step 3: Fetch Source Content

For each remaining candidate, use WebFetch to retrieve the content at the Original Link. This is the most important step because titles alone are often insufficient to judge editorial value.

When reading each source:

- Extract the core product or capability change
- Note specific features, numbers, or integrations mentioned
- Identify which partner motions are affected
- Flag if the source is thin (marketing fluff, no concrete details) or substantive

If a fetch fails (paywall, 404, etc.), note this and work from the title and any Notes in the Notion record. Flag the issue so Pat can investigate.

Fetch articles in parallel where possible to keep the session moving.

### Step 4: Score and Rank

Evaluate each candidate on three dimensions:

**Editorial substance (most important)**
How well does the source answer the four editorial filter questions? Articles with concrete product changes, named features, specific integrations, or measurable capabilities score higher. Vague announcements, pure marketing copy, or general thought leadership score lower.

**Recency**
More recent Queue Dates and Article Dates are preferred, all else being equal. An article queued three weeks ago that is highly substantive still beats a thin article queued yesterday.

**Topic diversity**
The three recommended articles should span different topics, vendors, or partner motions when possible. Three articles about the same vendor or the same motion (e.g., all co-sell) make for a repetitive edition. Aim for variety that gives readers a broader view of the partner tech landscape.

### Step 5: Present Recommendations

Present exactly three recommended articles in a numbered list. For each, include:

1. **Title** (linked to the Notion record URL)
2. **Vendor/Account** (if known)
3. **Queue Date**
4. **One-sentence summary** of what changed (written in partechstack editorial voice: neutral, concrete, no hype)
5. **Rationale** explaining why this article earned a spot: what makes it editorially strong, what motion it covers, and how it contributes to topic diversity across the three picks
6. **Source quality note**: whether the source content was substantive, thin, or inaccessible

After the three picks, include a brief section:

**Also considered:**
List 2-3 runner-up articles with a one-line note on why they did not make the top three (e.g., "similar topic to pick #2," "source content was too thin," "queued over three weeks ago").

**Flagged issues:**
Note any articles where the source link was broken, paywalled, or returned insufficient content.

### What Not to Do

- Do not update any Notion records. This skill is recommendation-only.
- Do not fabricate details about articles. If the source is inaccessible, say so.
- Do not force a recommendation count. If only two strong candidates exist, say so and explain why a third was not included.
- Do not include articles that have already been published (partechstack URL populated).
- Do not write the article summaries or drafts. That is a separate workflow.

## Editorial Voice Reminders

When writing summaries and rationale:

- Neutral, third person, plain English
- No hype or vendor superlatives
- No em dashes
- No exclamation points
- Short to medium sentences
- Focus on what changed and workflow impact
- "partechstack" is never capitalized

## Notion Database Reference

**partechstack Queue**: `collection://845dad83-baa2-4e51-a382-eebdc66d0abe`
- Publishing Queue view: `https://www.notion.so/5a6fc95e449542e3a691eca47818f07c?v=1a7bd15fa27180d89aea000cfa8566fc`

Key properties:
- Title (title)
- Status (status): Not started, Review, On Hold, In progress, Ready to Publish, Sent to Ghost, Published on partechstack, Published on LinkedIn, Rejected, Duplicate, Rollup
- Original Link (url): Source article URL
- Queue Date (date): When the article entered the queue
- Article Date (date): Original publication date of the source
- Account Name (text): Vendor/company name
- Topics (multi_select): account-mapping, affiliate, AI, analytics, co-sell, integration, marketplace, etc.
- Notes (text): Editorial notes
- partechstack URL (url): Populated after publication (used to exclude already-published items)
- Account Link (relation): Links to the partechstack Tracker database
