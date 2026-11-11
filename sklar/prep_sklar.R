# Tidy the Sklar et al. (2012) Experiment 6 data for the Psych 251 visualization workshop.
# Input: raw/ (data shared by Asael Sklar, with the corrections used in earlier Psych 251 years).
# Output: sklar2012_expt6.csv, one row per subject x trial.
suppressPackageStartupMessages(library(tidyverse))

read_order <- function(f) {
  read_csv(f, show_col_types = FALSE) |>
    pivot_longer(cols = matches("^[0-9]+$"), names_to = "subid", values_to = "rt",
                 names_transform = as.integer, values_drop_na = TRUE)
}

trials <- bind_rows(read_order("raw/sklar_expt6a_corrected.csv"),
                    read_order("raw/sklar_expt6b_corrected.csv"))
subinfo <- read_csv("raw/sklar_expt6_subinfo_corrected.csv", show_col_types = FALSE)

d <- trials |>
  left_join(subinfo, by = "subid") |>
  transmute(
    subid,
    order = counterbalance,
    presentation_ms = presentation.time,
    reported_seeing_primes = subjective.test == 1,
    objective_accuracy = objective.test,
    prime, prime_result = prime.result, target,
    operation = recode(operand, A = "addition", S = "subtraction"),
    congruent = congruent == "yes",
    distance,                      # prime_result - target; 0 on congruent trials
    rt
  ) |>
  arrange(subid, operation, prime)

stopifnot(!anyNA(d$presentation_ms), all(d$distance[d$congruent] == 0))
write_csv(d, "sklar2012_expt6.csv")
