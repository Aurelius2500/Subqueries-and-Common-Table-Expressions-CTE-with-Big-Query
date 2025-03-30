SELECT workforce,
COUNT(DISTINCT report_year) AS num_of_years,
AVG(male_index_us_over_global) AS avg_male_index_us_over_global,
AVG(women_index_us_over_global) AS avg_women_index_us_over_global
FROM
(
  SELECT *,
  gender_us_men/gender_global_men AS male_index_us_over_global,
  gender_us_women/gender_global_women AS women_index_us_over_global
  FROM `bigquery-public-data.google_dei.dar_non_intersectional_representation`
  WHERE workforce = 'tech'
  ORDER BY report_year DESC
) AS ddata
GROUP BY workforce
