---
output: github_document
---

# UWBiost561

This is a demo package created by Seth Peacock for Biost 561.

- The URL to the GitHub is: https://github.com/SethPeacock/UWBiost561
- The URL to the Pkgdown webpage is: https://sethpeacock.github.io/UWBiost561/

# How to install
This package is called `UWBiost561`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("sethpeacock/UWBiost561")
```

Upon completion, you can run the following code (in R):
```R
library(UWBiost561)
UW561Biost::run_example()
```

# Dependencies

The package depends on the following packages: `MASS` and `mvtnorm`.

# Session info

This package was developed in the following environment
```R
> devtools::session_info()
─ Session info ──────────────────────────────────────────────────────────
 setting  value
 version  R version 4.4.1 (2024-06-14 ucrt)
 os       Windows 11 x64 (build 26100)
 system   x86_64, mingw32
 ui       RStudio
 language (EN)
 collate  English_United States.utf8
 ctype    English_United States.utf8
 tz       America/Los_Angeles
 date     2025-06-13
 rstudio  2024.12.1+563 Kousa Dogwood (desktop)
 pandoc   3.2 @ C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools/ (via rmarkdown)
 quarto   ERROR: Unknown command "TMPDIR=C:/Users/bypea/AppData/Local/Temp/RtmpC6gEKE/file6fd079e56c66". Did you mean command "create"? @ C:\\PROGRA~1\\RStudio\\RESOUR~1\\app\\bin\\quarto\\bin\\quarto.exe

─ Packages ──────────────────────────────────────────────────────────────
 package     * version date (UTC) lib source
 askpass       1.2.1   2024-10-04 [1] CRAN (R 4.4.1)
 cachem        1.1.0   2024-05-16 [1] CRAN (R 4.4.1)
 cli           3.6.3   2024-06-21 [1] CRAN (R 4.4.1)
 credentials   2.0.2   2024-10-04 [1] CRAN (R 4.4.2)
 curl          6.2.0   2025-01-23 [1] CRAN (R 4.4.2)
 desc          1.4.3   2023-12-10 [1] CRAN (R 4.4.2)
 devtools      2.4.5   2022-10-11 [1] CRAN (R 4.4.3)
 digest        0.6.37  2024-08-19 [1] CRAN (R 4.4.1)
 ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.4.2)
 evaluate      1.0.3   2025-01-10 [1] CRAN (R 4.4.2)
 fastmap       1.2.0   2024-05-15 [1] CRAN (R 4.4.1)
 fs            1.6.5   2024-10-30 [1] CRAN (R 4.4.2)
 gert          2.1.4   2024-10-14 [1] CRAN (R 4.4.2)
 gh            1.4.1   2024-03-28 [1] CRAN (R 4.4.2)
 gitcreds      0.1.2   2022-09-08 [1] CRAN (R 4.4.2)
 glue          1.8.0   2024-09-30 [1] CRAN (R 4.4.1)
 htmltools     0.5.8.1 2024-04-04 [1] CRAN (R 4.4.1)
 htmlwidgets   1.6.4   2023-12-06 [1] CRAN (R 4.4.1)
 httpuv        1.6.15  2024-03-26 [1] CRAN (R 4.4.1)
 httr2         1.1.0   2025-01-18 [1] CRAN (R 4.4.2)
 jsonlite      1.8.9   2024-09-20 [1] CRAN (R 4.4.1)
 knitr         1.49    2024-11-08 [1] CRAN (R 4.4.2)
 later         1.3.2   2023-12-06 [1] CRAN (R 4.4.1)
 lifecycle     1.0.4   2023-11-07 [1] CRAN (R 4.4.1)
 magrittr      2.0.3   2022-03-30 [1] CRAN (R 4.4.1)
 memoise       2.0.1   2021-11-26 [1] CRAN (R 4.4.1)
 mime          0.12    2021-09-28 [1] CRAN (R 4.4.0)
 miniUI        0.1.1.1 2018-05-18 [1] CRAN (R 4.4.1)
 openssl       2.3.2   2025-02-03 [1] CRAN (R 4.4.2)
 pillar        1.10.1  2025-01-07 [1] CRAN (R 4.4.2)
 pkgbuild      1.4.6   2025-01-16 [1] CRAN (R 4.4.2)
 pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.4.1)
 pkgdown       2.1.1   2024-09-17 [1] CRAN (R 4.4.2)
 pkgload       1.4.0   2024-06-28 [1] CRAN (R 4.4.2)
 profvis       0.4.0   2024-09-20 [1] CRAN (R 4.4.2)
 promises      1.3.2   2024-11-28 [1] CRAN (R 4.4.2)
 purrr         1.0.2   2023-08-10 [1] CRAN (R 4.4.1)
 R6            2.5.1   2021-08-19 [1] CRAN (R 4.4.1)
 rappdirs      0.3.3   2021-01-31 [1] CRAN (R 4.4.1)
 Rcpp          1.0.13  2024-07-17 [1] CRAN (R 4.4.1)
 remotes       2.5.0   2024-03-17 [1] CRAN (R 4.4.2)
 rlang         1.1.4   2024-06-04 [1] CRAN (R 4.4.1)
 rmarkdown     2.29    2024-11-04 [1] CRAN (R 4.4.2)
 rprojroot     2.0.4   2023-11-05 [1] CRAN (R 4.4.1)
 rstudioapi    0.17.1  2024-10-22 [1] CRAN (R 4.4.2)
 sessioninfo   1.2.3   2025-02-05 [1] CRAN (R 4.4.2)
 shiny         1.10.0  2024-12-14 [1] CRAN (R 4.4.2)
 sys           3.4.3   2024-10-04 [1] CRAN (R 4.4.1)
 tibble        3.2.1   2023-03-20 [1] CRAN (R 4.4.1)
 urlchecker    1.0.1   2021-11-30 [1] CRAN (R 4.4.2)
 usethis       3.1.0   2024-11-26 [1] CRAN (R 4.4.2)
 vctrs         0.6.5   2023-12-01 [1] CRAN (R 4.4.1)
 withr         3.0.2   2024-10-28 [1] CRAN (R 4.4.2)
 xfun          0.50    2025-01-07 [1] CRAN (R 4.4.2)
 xtable        1.8-4   2019-04-21 [1] CRAN (R 4.4.1)
 yaml          2.3.10  2024-07-26 [1] CRAN (R 4.4.1)


─────────────────────────────────────────────────────────────────────────
```
