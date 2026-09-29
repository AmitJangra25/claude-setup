---
name: cannot-see-permission-prompts
description: "Claude cannot observe permission prompts — an approved prompt looks identical to an ungated run, so ask rather than infer silence"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 65ba47c4-1192-4fbe-b392-0613087151a4
  modified: 2026-09-28T13:39:50.835Z
---

I cannot see permission prompts. When Amit approves one, the tool result I get back is
indistinguishable from a command that was never gated — same output, no marker. So I must
never conclude "no prompt appeared" from the fact that I received output.

**Why:** On 2026-09-28, testing whether `Bash(*compile:vault*)` in Voice-Flow's
`.claude/settings.json` actually fires, I ran a harmless `grep -c compile:vault
package.json`, got `1` back, and reported that the rule had not fired. It had fired. Amit
had approved it. I then built a two-candidate causal story to explain a silence that never
happened, and only found out because he said he had seen five prompts. The rule was
working the whole time.

**How to apply:** When a test turns on whether something prompted, say up front that I
cannot see it. Run one command per message so each prompt maps to one command
unambiguously, and ask Amit to report or paste the prompt text. The prompt names the rule
that fired — that text is the evidence, my tool output is not. Also worth knowing: a
prompt can come from the auto-mode classifier or another gate, not only from an `ask`
rule, so the rule name in the prompt is what identifies the cause.

Related: [[fix-root-cause-flag-workarounds]], [[report-findings-dont-chase-them]].
