# Market Insights Operator Prompts

## Purpose
This document provides reusable operator prompts for the `market_insights` agent inside NOC.

These prompts are designed for internal use by Andy, Josh, or other operators who want consistent, reviewable outputs for BDR coaching and account prioritization.

## Usage Notes
- Use these prompts inside NOC / WebChat with the `market_insights` agent selected.
- Replace bracketed placeholders with real values.
- Keep prompts grounded in verified internal data when available.
- When data is incomplete, the agent should surface limitations rather than guess.

---

## Prompt 1: Account Quality Scorecard
Use when you want a single-account internal scorecard for BDR coaching or prioritization.

```text
Prepare an account quality scorecard for [ACCOUNT OR REFERRAL SOURCE NAME]. Date range: [DATE RANGE]. Known data: referral volume [X], conversion count [Y], care-plan mix [DETAILS IF AVAILABLE], territory [NAME], BDR [NAME]. Context: internal BDR coaching and account prioritization. Use the required Market Insights output format. Clearly separate verified data from interpretation, state data-quality issues, classify the account as Focus, Watch, Maintain, or Deprioritize only if justified by the data, include the reason for the classification, recommend the next verification step where needed, and include confidence level and escalation note.
```

### Best for
- one account review
- referral-source coaching
- targeted BDR prep
- deciding whether an account deserves more, less, or different attention

---

## Prompt 2: Territory Coaching Brief
Use when you want a portfolio-level view across multiple accounts in one territory or one BDR’s book of business.

```text
Prepare a territory coaching brief for [BDR NAME] in [TERRITORY NAME]. Date range: [DATE RANGE]. Known data: [ACCOUNT 1] referral volume [X], conversions [Y]; [ACCOUNT 2] referral volume [X], conversions [Y]; [ACCOUNT 3] referral volume [X], conversions [Y]; [ACCOUNT 4] referral volume [X], conversions [Y]. Context: internal BDR coaching and account prioritization. Use the required Market Insights output format. Clearly identify which accounts appear to be Focus, Watch, Maintain, or Deprioritize only if justified by the data. Distinguish observed signal from missing context, state data-quality issues, and recommend next verification steps where needed.
```

### Best for
- weekly coaching with a BDR
- territory review meetings
- prioritization across a group of accounts
- surfacing where attention should increase, decrease, or shift

---

## Prompt 3: Date-Range Trend Comparison
Use when you want to compare one account, one referral source, one BDR, or one territory across two periods.

```text
Prepare a date-range trend comparison for [ACCOUNT / REFERRAL SOURCE / BDR / TERRITORY]. Compare [DATE RANGE 1] versus [DATE RANGE 2]. Known data for period 1: referral volume [X], conversion count [Y], care-plan mix [DETAILS IF AVAILABLE]. Known data for period 2: referral volume [X], conversion count [Y], care-plan mix [DETAILS IF AVAILABLE]. Context: internal trend review for BDR coaching and account prioritization. Use the required Market Insights output format. Clearly distinguish verified changes from inferred explanations, state missing context or data-quality issues, describe whether the observed change appears meaningful or limited, and recommend the next verification step where needed.
```

### Best for
- month-over-month comparison
- quarter-over-quarter review
- investigating a drop or rise in performance
- identifying where a trend may need attention without overstating cause

---

## Optional Prompt Add-Ons
These can be appended when needed.

### Add-on: force causal restraint
```text
Do not imply a cause for observed performance changes unless the available data supports that conclusion.
```

### Add-on: force comparison restraint
```text
Do not treat the provided accounts as a formal benchmark set unless a benchmark is explicitly provided.
```

### Add-on: force next-step verification
```text
If the data is insufficient for a strong recommendation, recommend the next verification step instead.
```

### Add-on: force tentative classification on small samples
```text
Treat small-sample classifications cautiously and state when a classification is tentative.
```

---

## Recommendation
Use these prompts as the standard operator starting points for `market_insights` so outputs stay consistent across BDR coaching and internal prioritization work.
