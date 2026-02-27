{% macro clean_nulls(column_name, default_value = 'Unknown') %}

    coalesce({{ column_name }}, '{{ default_value }}')
  
{% endmacro %}