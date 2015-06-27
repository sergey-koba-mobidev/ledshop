# Ansible
`ansible-playbook -i inventories/production appservers.yml`

# Capistrano
`cap production deploy`

# Problems
- 512 ram (DigitalOcean) is not enough for assets precompile you should create swap file: http://stackoverflow.com/questions/22272339/rake-assetsprecompile-gets-killed-when-there-is-a-console-session-open-in-produ
- need upload public/assets
- need upload spree images

# Dump PG data
`pg_dump ledshop_development -a -f /vagrant/dump.sql -F p`
`psql -f dump.sql -U ledshop_user ledshop_db`

# Truncate all data
ledshop_db=> TRUNCATE TABLE friendly_id_slugs;
TRUNCATE TABLE
ledshop_db=>
ledshop_db=>
ledshop_db=> TRUNCATE TABLE spree_addresses;
TRUNCATE TABLE
ledshop_db=> Select * from spree_addresses;
ledshop_db=>
ledshop_db=>
ledshop_db=>
ledshop_db=> Select * from friendly_id_slugs
ledshop_db-> ;
 id | slug | sluggable_id | sluggable_type | scope | created_at | deleted_at
----+------+--------------+----------------+-------+------------+------------
(0 rows)

ledshop_db=> TRUNCATE TABLE spree_adjustments;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_assets ;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_calculators ;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_countries ;
TRUNCATE TABLE
ledshop_db=>
ledshop_db=> TRUNCATE TABLE spree_credit_cards ;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_customer_returns;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_gateways;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_inventory_units;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_line_items;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_log_entries;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_option_type_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_option_types;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_option_types_prototypes;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_option_value_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_option_values;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_option_values_variants;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_orders;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_orders_promotions;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_pages;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_pages_stores;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_payment_capture_events;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_payment_methods;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_payments;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_preferences;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_prices;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_product_option_types;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_product_properties;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_product_property_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_product_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_products;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_products_promotion_rules;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_products_taxons;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_promotion_action_line_items;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_promotion_actions;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_promotion_categories;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_promotion_rules;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_promotion_rules_users;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_promotion_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_promotions;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_properties;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_properties_prototypes;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_property_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_prototypes;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_refund_reasons;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_refunds;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_reimbursement_credits;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_reimbursement_types;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_reimbursements;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_return_authorization_reasons;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_return_authorizations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_return_items;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_roles;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_roles_users;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_shipments;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_shipping_categories;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_shipping_method_categories;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_shipping_methods;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_shipping_methods_zones;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_shipping_rates;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_state_changes;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_states;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_stock_items;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_stock_locations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_stock_movements;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_stock_transfers;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_stores;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_tax_categories;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_tax_rates;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_taxon_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_taxonomies;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_taxonomy_translations;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_taxons;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_taxons_promotion_rules;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_taxons_prototypes;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_trackers;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_users;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_variants;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_zone;
spree_zone_members  spree_zones
ledshop_db=> TRUNCATE TABLE spree_zone_members;
TRUNCATE TABLE
ledshop_db=> TRUNCATE TABLE spree_zones;
TRUNCATE TABLE
ledshop_db=>
