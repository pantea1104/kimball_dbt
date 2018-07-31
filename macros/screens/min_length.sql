---------- MIN LENGTH SCREEN
---- verifies the value length is at least a min value
{%- macro min_length(screen_args, kwargs) -%}
---- Pass the screen_args object with these params:
----    - min_length (number) the value an instance of the column must be greater than or equal to 
----    - column (string) the column tested. 
---- Pass the kwargs object with these params:
----    - database (string) the source database 
----    - schema (string) the source schema
----    - entity (string) the source table / view name
----    - audit_key (integer) the Fkey to the audit being performed
----    - cdc_target (string) the column used to indicate change in the entity
----    - lowest_cdc (string) the lowest cdc_target value in this audit
----    - highest_cdc (string) the highest cdc_target value in this audit
----    - cdc_data_type (string) the native data type of the cdc_column in the source entity
----    - record_identifier (string) the primary key for the source entity

    {{kwargs.database}}_{{kwargs.schema}}_{{kwargs.entity}}_{{screen_args.column}}_MIN_LENGTH AS (
        SELECT
            {{universal_audit_property_set('min_length',screen_args,kwargs)}}

        AND
            LENGTH({{screen_args.column}}) > {{screen_args.min_length}}::number
    )
{%- endmacro -%}