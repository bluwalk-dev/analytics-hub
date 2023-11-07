with

source as (
    select
        *
    from {{ source('hubspot', 'contact') }}
),

transformation as (

    SELECT
    
        CAST(id AS INT64) id,
        CAST(is_deleted AS BOOL) is_deleted,
        CAST(property_account_location AS STRING) account_location,
        CAST(property_account_type AS STRING) account_type,
        CAST(property_active_bookings AS FLOAT64) active_bookings,
        CAST(property_active_vehicle_contracts AS BOOL) active_vehicle_contracts,
        CAST(property_address AS STRING) address,
        CAST(property_aircall_last_call_at AS TIMESTAMP) aircall_last_call_at,
        CAST(property_associatedcompanyid AS FLOAT64) associatedcompanyid,
        CAST(property_car_insurance_deal_status AS STRING) car_insurance_deal_status,
        CAST(property_city AS STRING) city,
        CAST(property_closedate AS TIMESTAMP) closedate,
        CAST(property_country AS STRING) country,
        CAST(property_createdate AS TIMESTAMP) createdate,
        CAST(property_currentlyinworkflow AS BOOL) currentlyinworkflow,
        CAST(property_date_of_birth AS STRING) date_of_birth,
        CAST(property_days_to_close AS FLOAT64) days_to_close,
        CAST(property_deal_bolt_create AS STRING) deal_bolt_create,
        CAST(property_deal_boltfood_create AS STRING) deal_boltfood_create,
        CAST(property_deal_correos_create AS STRING) deal_correos_create,
        CAST(property_deal_drivfit_create AS STRING) deal_drivfit_create,
        CAST(property_deal_drivfit_offer_base_price AS FLOAT64) deal_drivfit_offer_base_price,
        CAST(property_deal_drivfit_offer_description AS STRING) deal_drivfit_offer_description,
        CAST(property_deal_drivfit_offer_vehicle_category AS STRING) deal_drivfit_offer_vehicle_category,
        CAST(property_deal_drivfit_vehicle_pickup AS STRING) deal_drivfit_vehicle_pickup,
        CAST(property_deal_fuel_energy_card_type AS STRING) deal_fuel_energy_card_type,
        CAST(property_deal_mercadao_create AS STRING) deal_mercadao_create,
        CAST(property_deal_owner_drivers AS INT64) deal_owner_drivers,
        CAST(property_deal_owner_insurance AS INT64) deal_owner_insurance,
        CAST(property_deal_tvde_training_create AS STRING) deal_tvde_training_create,
        CAST(property_deal_tvde_training_end_date AS DATETIME) deal_tvde_training_end_date,
        CAST(property_deal_tvde_training_offer_description AS STRING) deal_tvde_training_offer_description,
        CAST(property_deal_tvde_training_partner_name AS STRING) deal_tvde_training_partner_name,
        CAST(property_deal_tvde_training_start_date AS DATETIME) deal_tvde_training_start_date,
        CAST(property_deal_tvde_training_value AS FLOAT64) deal_tvde_training_value,
        CAST(property_deal_uber_create AS STRING) deal_uber_create,
        CAST(property_dua AS STRING) dua,
        CAST(property_email AS STRING) email,
        CAST(property_first_conversion_date AS TIMESTAMP) first_conversion_date,
        CAST(property_first_conversion_event_name AS STRING) first_conversion_event_name,
        CAST(property_first_deal_created_date AS TIMESTAMP) first_deal_created_date,
        CAST(property_firstname AS STRING) firstname,
        CAST(property_hs_additional_emails AS STRING) hs_additional_emails,
        CAST(property_hs_all_accessible_team_ids AS STRING) hs_all_accessible_team_ids,
        CAST(property_hs_all_contact_vids AS STRING) hs_all_contact_vids,
        CAST(property_hs_all_owner_ids AS STRING) hs_all_owner_ids,
        CAST(property_hs_all_team_ids AS STRING) hs_all_team_ids,
        CAST(property_hs_analytics_average_page_views AS FLOAT64) hs_analytics_average_page_views,
        CAST(property_hs_analytics_first_referrer AS STRING) hs_analytics_first_referrer,
        CAST(property_hs_analytics_first_timestamp AS TIMESTAMP) hs_analytics_first_timestamp,
        CAST(property_hs_analytics_first_url AS STRING) hs_analytics_first_url,
        CAST(property_hs_analytics_first_visit_timestamp AS TIMESTAMP) hs_analytics_first_visit_timestamp,
        CAST(property_hs_analytics_last_referrer AS STRING) hs_analytics_last_referrer,
        CAST(property_hs_analytics_last_timestamp AS TIMESTAMP) hs_analytics_last_timestamp,
        CAST(property_hs_analytics_last_url AS STRING) hs_analytics_last_url,
        CAST(property_hs_analytics_last_visit_timestamp AS TIMESTAMP) hs_analytics_last_visit_timestamp,
        CAST(property_hs_analytics_num_event_completions AS FLOAT64) hs_analytics_num_event_completions,
        CAST(property_hs_analytics_num_page_views AS FLOAT64) hs_analytics_num_page_views,
        CAST(property_hs_analytics_num_visits AS FLOAT64) hs_analytics_num_visits,
        CAST(property_hs_analytics_revenue AS FLOAT64) hs_analytics_revenue,
        CAST(property_hs_analytics_source AS STRING) hs_analytics_source,
        CAST(property_hs_analytics_source_data_1 AS STRING) hs_analytics_source_data_1,
        CAST(property_hs_analytics_source_data_2 AS STRING) hs_analytics_source_data_2,
        CAST(property_hs_avatar_filemanager_key AS STRING) hs_avatar_filemanager_key,
        CAST(property_hs_calculated_form_submissions AS STRING) hs_calculated_form_submissions,
        CAST(property_hs_calculated_merged_vids AS STRING) hs_calculated_merged_vids,
        CAST(property_hs_calculated_mobile_number AS STRING) hs_calculated_mobile_number,
        CAST(property_hs_calculated_phone_number AS STRING) hs_calculated_phone_number,
        CAST(property_hs_calculated_phone_number_country_code AS STRING) hs_calculated_phone_number_country_code,
        CAST(property_hs_count_is_unworked AS FLOAT64) hs_count_is_unworked,
        CAST(property_hs_count_is_worked AS FLOAT64) hs_count_is_worked,
        CAST(property_hs_created_by_conversations AS BOOL) hs_created_by_conversations,
        CAST(property_hs_created_by_user_id AS FLOAT64) hs_created_by_user_id,
        CAST(property_hs_date_entered_customer AS TIMESTAMP) hs_date_entered_customer,
        CAST(property_hs_date_entered_evangelist AS TIMESTAMP) hs_date_entered_evangelist,
        CAST(property_hs_date_entered_lead AS TIMESTAMP) hs_date_entered_lead,
        CAST(property_hs_date_entered_opportunity AS TIMESTAMP) hs_date_entered_opportunity,
        CAST(property_hs_date_exited_customer AS TIMESTAMP) hs_date_exited_customer,
        CAST(property_hs_date_exited_lead AS TIMESTAMP) hs_date_exited_lead,
        CAST(property_hs_date_exited_opportunity AS TIMESTAMP) hs_date_exited_opportunity,
        CAST(property_hs_email_bad_address AS BOOL) hs_email_bad_address,
        CAST(property_hs_email_bounce AS FLOAT64) hs_email_bounce,
        CAST(property_hs_email_click AS FLOAT64) hs_email_click,
        CAST(property_hs_email_delivered AS FLOAT64) hs_email_delivered,
        CAST(property_hs_email_domain AS STRING) hs_email_domain,
        CAST(property_hs_email_first_click_date AS TIMESTAMP) hs_email_first_click_date,
        CAST(property_hs_email_first_open_date AS TIMESTAMP) hs_email_first_open_date,
        CAST(property_hs_email_first_send_date AS TIMESTAMP) hs_email_first_send_date,
        CAST(property_hs_email_hard_bounce_reason_enum AS STRING) hs_email_hard_bounce_reason_enum,
        CAST(property_hs_email_last_click_date AS TIMESTAMP) hs_email_last_click_date,
        CAST(property_hs_email_last_email_name AS STRING) hs_email_last_email_name,
        CAST(property_hs_email_last_open_date AS TIMESTAMP) hs_email_last_open_date,
        CAST(property_hs_email_last_send_date AS TIMESTAMP) hs_email_last_send_date,
        CAST(property_hs_email_open AS FLOAT64) hs_email_open,
        CAST(property_hs_email_optout AS BOOL) hs_email_optout,
        CAST(property_hs_email_optout_195205977 AS BOOL) hs_email_optout_195205977,
        CAST(property_hs_email_optout_236046006 AS BOOL) hs_email_optout_236046006,
        CAST(property_hs_facebook_click_id AS STRING) hs_facebook_click_id,
        CAST(property_hs_first_engagement_object_id AS FLOAT64) hs_first_engagement_object_id,
        CAST(property_hs_first_outreach_date AS TIMESTAMP) hs_first_outreach_date,
        CAST(property_hs_google_click_id AS STRING) hs_google_click_id,
        CAST(property_hs_ip_timezone AS STRING) hs_ip_timezone,
        CAST(property_hs_is_contact AS BOOL) hs_is_contact,
        CAST(property_hs_is_unworked AS BOOL) hs_is_unworked,
        CAST(property_hs_language AS STRING) hs_language,
        CAST(property_hs_last_sales_activity_date AS TIMESTAMP) hs_last_sales_activity_date,
        CAST(property_hs_last_sales_activity_timestamp AS TIMESTAMP) hs_last_sales_activity_timestamp,
        CAST(property_hs_last_sales_activity_type AS STRING) hs_last_sales_activity_type,
        CAST(property_hs_latest_source AS STRING) hs_latest_source,
        CAST(property_hs_latest_source_data_1 AS STRING) hs_latest_source_data_1,
        CAST(property_hs_latest_source_data_2 AS STRING) hs_latest_source_data_2,
        CAST(property_hs_latest_source_timestamp AS TIMESTAMP) hs_latest_source_timestamp,
        CAST(property_hs_lead_status AS STRING) hs_lead_status,
        CAST(property_hs_legal_basis AS STRING) hs_legal_basis,
        CAST(property_hs_lifecyclestage_customer_date AS TIMESTAMP) hs_lifecyclestage_customer_date,
        CAST(property_hs_lifecyclestage_evangelist_date AS TIMESTAMP) hs_lifecyclestage_evangelist_date,
        CAST(property_hs_lifecyclestage_lead_date AS TIMESTAMP) hs_lifecyclestage_lead_date,
        CAST(property_hs_lifecyclestage_opportunity_date AS TIMESTAMP) hs_lifecyclestage_opportunity_date,
        CAST(property_hs_marketable_reason_id AS STRING) hs_marketable_reason_id,
        CAST(property_hs_marketable_reason_type AS STRING) hs_marketable_reason_type,
        CAST(property_hs_marketable_status AS BOOL) hs_marketable_status,
        CAST(property_hs_marketable_until_renewal AS BOOL) hs_marketable_until_renewal,
        CAST(property_hs_merged_object_ids AS STRING) hs_merged_object_ids,
        CAST(property_hs_object_id AS FLOAT64) hs_object_id,
        CAST(property_hs_object_source AS STRING) hs_object_source,
        CAST(property_hs_object_source_id AS STRING) hs_object_source_id,
        CAST(property_hs_object_source_user_id AS FLOAT64) hs_object_source_user_id,
        CAST(property_hs_pipeline AS STRING) hs_pipeline,
        CAST(property_hs_sa_first_engagement_date AS TIMESTAMP) hs_sa_first_engagement_date,
        CAST(property_hs_sa_first_engagement_descr AS STRING) hs_sa_first_engagement_descr,
        CAST(property_hs_sa_first_engagement_object_type AS STRING) hs_sa_first_engagement_object_type,
        CAST(property_hs_sales_email_last_clicked AS TIMESTAMP) hs_sales_email_last_clicked,
        CAST(property_hs_sales_email_last_opened AS TIMESTAMP) hs_sales_email_last_opened,
        CAST(property_hs_sales_email_last_replied AS TIMESTAMP) hs_sales_email_last_replied,
        CAST(property_hs_searchable_calculated_mobile_number AS INT64) hs_searchable_calculated_mobile_number,
        CAST(property_hs_searchable_calculated_phone_number AS INT64) hs_searchable_calculated_phone_number,
        CAST(property_hs_sequences_actively_enrolled_count AS FLOAT64) hs_sequences_actively_enrolled_count,
        CAST(property_hs_social_facebook_clicks AS FLOAT64) hs_social_facebook_clicks,
        CAST(property_hs_social_google_plus_clicks AS FLOAT64) hs_social_google_plus_clicks,
        CAST(property_hs_social_linkedin_clicks AS FLOAT64) hs_social_linkedin_clicks,
        CAST(property_hs_social_num_broadcast_clicks AS FLOAT64) hs_social_num_broadcast_clicks,
        CAST(property_hs_social_twitter_clicks AS FLOAT64) hs_social_twitter_clicks,
        CAST(property_hs_time_between_contact_creation_and_deal_close AS FLOAT64) hs_time_between_contact_creation_and_deal_close,
        CAST(property_hs_time_between_contact_creation_and_deal_creation AS FLOAT64) hs_time_between_contact_creation_and_deal_creation,
        CAST(property_hs_time_in_customer AS FLOAT64) hs_time_in_customer,
        CAST(property_hs_time_in_evangelist AS FLOAT64) hs_time_in_evangelist,
        CAST(property_hs_time_in_lead AS FLOAT64) hs_time_in_lead,
        CAST(property_hs_time_in_opportunity AS FLOAT64) hs_time_in_opportunity,
        CAST(property_hs_time_to_first_engagement AS FLOAT64) hs_time_to_first_engagement,
        CAST(property_hs_time_to_move_from_lead_to_customer AS FLOAT64) hs_time_to_move_from_lead_to_customer,
        CAST(property_hs_time_to_move_from_opportunity_to_customer AS FLOAT64) hs_time_to_move_from_opportunity_to_customer,
        CAST(property_hs_timezone AS STRING) hs_timezone,
        CAST(property_hs_updated_by_user_id AS FLOAT64) hs_updated_by_user_id,
        CAST(property_hs_user_ids_of_all_owners AS STRING) hs_user_ids_of_all_owners,
        CAST(property_hs_v_2_cumulative_time_in_customer AS FLOAT64) hs_v_2_cumulative_time_in_customer,
        CAST(property_hs_v_2_cumulative_time_in_lead AS FLOAT64) hs_v_2_cumulative_time_in_lead,
        CAST(property_hs_v_2_cumulative_time_in_opportunity AS FLOAT64) hs_v_2_cumulative_time_in_opportunity,
        CAST(property_hs_v_2_date_entered_customer AS TIMESTAMP) hs_v_2_date_entered_customer,
        CAST(property_hs_v_2_date_entered_evangelist AS TIMESTAMP) hs_v_2_date_entered_evangelist,
        CAST(property_hs_v_2_date_entered_lead AS TIMESTAMP) hs_v_2_date_entered_lead,
        CAST(property_hs_v_2_date_entered_opportunity AS TIMESTAMP) hs_v_2_date_entered_opportunity,
        CAST(property_hs_v_2_date_exited_customer AS TIMESTAMP) hs_v_2_date_exited_customer,
        CAST(property_hs_v_2_date_exited_lead AS TIMESTAMP) hs_v_2_date_exited_lead,
        CAST(property_hs_v_2_date_exited_opportunity AS TIMESTAMP) hs_v_2_date_exited_opportunity,
        CAST(property_hs_v_2_latest_time_in_customer AS FLOAT64) hs_v_2_latest_time_in_customer,
        CAST(property_hs_v_2_latest_time_in_lead AS FLOAT64) hs_v_2_latest_time_in_lead,
        CAST(property_hs_v_2_latest_time_in_opportunity AS FLOAT64) hs_v_2_latest_time_in_opportunity,
        CAST(property_hs_was_imported AS BOOL) hs_was_imported,
        CAST(property_hs_whatsapp_phone_number AS STRING) hs_whatsapp_phone_number,
        CAST(property_hubspot_owner_assigneddate AS TIMESTAMP) hubspot_owner_assigneddate,
        CAST(property_hubspot_owner_id AS INT64) hubspot_owner_id,
        CAST(property_hubspot_team_id AS INT64) hubspot_team_id,
        CAST(property_hubspotscore AS FLOAT64) hubspotscore,
        CAST(property_ip_city AS STRING) ip_city,
        CAST(property_ip_country AS STRING) ip_country,
        CAST(property_ip_country_code AS STRING) ip_country_code,
        CAST(property_ip_state AS STRING) ip_state,
        CAST(property_ip_state_code AS STRING) ip_state_code,
        CAST(property_jobtitle AS STRING) jobtitle,
        CAST(property_last_aircall_call_outcome AS STRING) last_aircall_call_outcome,
        CAST(property_last_used_aircall_phone_number AS STRING) last_used_aircall_phone_number,
        CAST(property_last_used_aircall_tags AS STRING) last_used_aircall_tags,
        CAST(property_lastmodifieddate AS TIMESTAMP) lastmodifieddate,
        CAST(property_lastname AS STRING) lastname,
        CAST(property_lifecyclestage AS STRING) lifecyclestage,
        CAST(property_mktplace_last_activity_food AS TIMESTAMP) mktplace_last_activity_food,
        CAST(property_mktplace_last_activity_groceries AS TIMESTAMP) mktplace_last_activity_groceries,
        CAST(property_mktplace_last_activity_parcel AS TIMESTAMP) mktplace_last_activity_parcel,
        CAST(property_mktplace_last_activity_ridesharing AS TIMESTAMP) mktplace_last_activity_ridesharing,
        CAST(property_mktplace_last_cycle_balance AS FLOAT64) mktplace_last_cycle_balance,
        CAST(property_mktplace_last_cycle_final_date AS TIMESTAMP) mktplace_last_cycle_final_date,
        CAST(property_mktplace_last_cycle_first_date AS TIMESTAMP) mktplace_last_cycle_first_date,
        CAST(property_mktplace_last_group_ridesharing AS STRING) mktplace_last_group_ridesharing,
        CAST(property_mktplace_last_payment_cycle AS FLOAT64) mktplace_last_payment_cycle,
        CAST(property_mktplace_rds_acceptance_rate_per_week AS FLOAT64) mktplace_rds_acceptance_rate_per_week,
        CAST(property_mktplace_rds_acceptance_rate_yesterday AS FLOAT64) mktplace_rds_acceptance_rate_yesterday,
        CAST(property_mktplace_rds_earnings_level_yesterday AS STRING) mktplace_rds_earnings_level_yesterday,
        CAST(property_mktplace_rds_earnings_rank_last_week AS FLOAT64) mktplace_rds_earnings_rank_last_week,
        CAST(property_mktplace_rds_last_nr_of_trips_yesterday AS FLOAT64) mktplace_rds_last_nr_of_trips_yesterday,
        CAST(property_mktplace_rds_net_earnings_per_online_hour_last_week AS FLOAT64) mktplace_rds_net_earnings_per_online_hour_last_week,
        CAST(property_mktplace_rds_net_earnings_per_trip_last_week AS FLOAT64) mktplace_rds_net_earnings_per_trip_last_week,
        CAST(property_mktplace_rds_net_earnings_yesterday AS FLOAT64) mktplace_rds_net_earnings_yesterday,
        CAST(property_mktplace_rds_online_hours_last_week AS FLOAT64) mktplace_rds_online_hours_last_week,
        CAST(property_mktplace_rds_percentage_of_days_with_earnings_above_130_last_week AS FLOAT64) mktplace_rds_percentage_of_days_with_earnings_above_130_last_week,
        CAST(property_mktplace_rds_percentage_of_days_with_first_trip_between_5_and_9_last_week AS FLOAT64) mktplace_rds_percentage_of_days_with_first_trip_between_5_and_9_last_week,
        CAST(property_mktplace_rds_percentage_of_weekend_days_worked_last_week AS FLOAT64) mktplace_rds_percentage_of_weekend_days_worked_last_week,
        CAST(property_mktplace_rds_top_driver_net_earnings_last_week AS FLOAT64) mktplace_rds_top_driver_net_earnings_last_week,
        CAST(property_mktplace_rds_total_net_earnings_last_week AS FLOAT64) mktplace_rds_total_net_earnings_last_week,
        CAST(property_mktplace_rds_total_number_of_trips_last_week AS FLOAT64) mktplace_rds_total_number_of_trips_last_week,
        CAST(property_mktplace_rds_total_worked_days_last_week AS FLOAT64) mktplace_rds_total_worked_days_last_week,
        CAST(property_mobilephone AS STRING) mobilephone,
        CAST(property_notes_last_contacted AS TIMESTAMP) notes_last_contacted,
        CAST(property_notes_last_updated AS TIMESTAMP) notes_last_updated,
        CAST(property_notes_next_activity_date AS TIMESTAMP) notes_next_activity_date,
        CAST(property_nps_date_of_response AS TIMESTAMP) nps_date_of_response,
        CAST(property_nps_reason AS STRING) nps_reason,
        CAST(property_nps_response AS FLOAT64) nps_response,
        CAST(property_nps_response_date AS STRING) nps_response_date,
        CAST(property_num_associated_deals AS FLOAT64) num_associated_deals,
        CAST(property_num_contacted_notes AS FLOAT64) num_contacted_notes,
        CAST(property_num_conversion_events AS FLOAT64) num_conversion_events,
        CAST(property_num_notes AS FLOAT64) num_notes,
        CAST(property_num_unique_conversion_events AS FLOAT64) num_unique_conversion_events,
        CAST(property_odoo_partner_id AS FLOAT64) odoo_partner_id,
        CAST(property_odoo_user_id AS FLOAT64) odoo_user_id,
        CAST(property_par_days_in_program AS FLOAT64) par_days_in_program,
        CAST(property_par_exit_reason AS STRING) par_exit_reason,
        CAST(property_par_number_days_with_0_earnings AS FLOAT64) par_number_days_with_0_earnings,
        CAST(property_par_number_of_days_with_earnings_below_70 AS FLOAT64) par_number_of_days_with_earnings_below_70,
        CAST(property_par_number_of_days_with_earnings_between_70_and_130 AS FLOAT64) par_number_of_days_with_earnings_between_70_and_130,
        CAST(property_par_subscription AS BOOL) par_subscription,
        CAST(property_par_unsubscription AS BOOL) par_unsubscription,
        CAST(property_personal_car_deal_status AS STRING) personal_car_deal_status,
        CAST(property_phone AS STRING) phone,
        CAST(property_recent_conversion_date AS TIMESTAMP) recent_conversion_date,
        CAST(property_recent_conversion_event_name AS STRING) recent_conversion_event_name,
        CAST(property_recent_deal_amount AS FLOAT64) recent_deal_amount,
        CAST(property_recent_deal_close_date AS TIMESTAMP) recent_deal_close_date,
        CAST(property_referral_code AS STRING) referral_code,
        CAST(property_state AS STRING) state,
        CAST(property_tax_identification_number AS STRING) tax_identification_number,
        CAST(property_today_date AS TIMESTAMP) today_date,
        CAST(property_total_revenue AS FLOAT64) total_revenue,
        CAST(property_uber_deal_status AS STRING) uber_deal_status,
        CAST(property_zip AS STRING) zip 

    FROM source

)

SELECT * FROM transformation
WHERE _fivetran_deleted IS FALSE
