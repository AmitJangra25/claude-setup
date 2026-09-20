# Local models — offloading chores to Ollama

`ollama-do` (on PATH) runs small dev chores against a local Ollama model:
commit messages, summaries, log triage, test-case lists. Use it when the input
is large, the **output is small**, and being slightly wrong is cheap and
obvious. If the output is large, do it yourself — reading a long local answer
back into context costs more than the work saved.

**Never send it** secrets, `.env` files, key material, or customer or employee
records — Emp Portal and Packbly hold real personal data. **Never use it for**
code that ships, code review, or anything security-, auth-, payment- or
migration-related.

Load the `ollama` skill before using it. It holds the full task list, the
security rules and why they exist, and the facts about this setup.
