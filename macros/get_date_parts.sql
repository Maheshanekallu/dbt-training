{% macro get_date_parts(date_column) %}
    named_struct(
      'year', EXTRACT(YEAR FROM {{ date_column }}),
      'month', EXTRACT(MONTH FROM {{ date_column }}),
      'day', EXTRACT(DAY FROM {{ date_column }}),
      'day_of_week', EXTRACT(DAYOFWEEK FROM {{ date_column }}),
      'day_of_year', datediff({{ date_column }}, date_trunc('year', {{ date_column }})) + 1,
      'week', EXTRACT(WEEK FROM {{ date_column }}),
      'quarter', EXTRACT(QUARTER FROM {{ date_column }})
    )
{% endmacro %}