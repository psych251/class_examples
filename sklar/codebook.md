# Sklar et al. (2012), Experiment 6: codebook

`sklar2012_expt6.csv` has one row per participant per trial (42 participants, 6,231 trials).
It was built from the raw files in `raw/` by `prep_sklar.R`. The data were shared by Asael
Sklar; the `_corrected` raw files include corrections made for earlier years of Psych 251.

| Column | Meaning |
|---|---|
| `subid` | Participant ID (1–42) |
| `order` | Counterbalancing order (1 or 2) |
| `presentation_ms` | How long the masked prime was shown, in ms (1700 or 2000; varies between participants) |
| `reported_seeing_primes` | Subjective awareness check: `TRUE` if the participant said they saw the primes |
| `objective_accuracy` | Objective awareness check: proportion correct when guessing the parity of the primes (chance = .5) |
| `prime` | The arithmetic problem shown as the (masked) prime, e.g. `=1+2+5` |
| `prime_result` | The answer to the prime problem |
| `target` | The number the participant read aloud |
| `operation` | `addition` or `subtraction` prime |
| `congruent` | `TRUE` if the target equals the prime's answer |
| `distance` | `prime_result - target`; 0 on congruent trials |
| `rt` | Time to start naming the target, in ms |

**Exclusions used in the paper:** participants were excluded if they reported seeing the
primes (`reported_seeing_primes == TRUE`) or if their objective accuracy was reliably above
chance (`objective_accuracy >= .6`). This leaves 17 participants.
