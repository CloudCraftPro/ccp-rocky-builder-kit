# Sequence Counters

Tracks daily capture sequence numbers per category. Format: `YYYY-MM-DD: Q=N D=N T=N C=N X=N`.
Reset to zero each day. Increment when creating a new capture.

| Date | Q | D | T | C | X |
|---|---|---|---|---|---|
| 2026-05-28 | 1 | 1 | 1 | 0 | 0 |
| 2026-05-30 | 0 | 1 | 0 | 1 | 0 |
| 2026-06-01 | 1 | 0 | 3 | 1 | 1 |
| 2026-06-02 | 0 | 0 | 0 | 1 | 0 |
