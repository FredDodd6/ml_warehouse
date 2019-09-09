
package WTSI::DNAP::Warehouse::Schema::Result::IseqExternalProductComponent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

WTSI::DNAP::Warehouse::Schema::Result::IseqExternalProductComponent

=head1 DESCRIPTION

Table linking iseq_external_product_metrics table data to components in the iseq_product_metrics table

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components('InflateColumn::DateTime');

=head1 TABLE: C<iseq_external_product_components>

=cut

__PACKAGE__->table('iseq_external_product_components');

=head1 ACCESSORS

=head2 id_iseq_ext_pr_components_tmp

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

Internal to this database id, value can change

=head2 id_iseq_pr_tmp

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

iseq_external_product_metrics table row id for the product

=head2 id_iseq_pr_component_tmp

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

iseq_product_metrics table row id for one of this product's components

=head2 num_components

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

Number of component products for this product

=head2 component_index

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

Unique component index within all components of this product, a value from 1 to the value of num_components column for this product

=cut

__PACKAGE__->add_columns(
  'id_iseq_ext_pr_components_tmp',
  {
    data_type => 'bigint',
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  'id_iseq_pr_tmp',
  {
    data_type => 'bigint',
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  'id_iseq_pr_component_tmp',
  {
    data_type => 'bigint',
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  'num_components',
  { data_type => 'tinyint', extra => { unsigned => 1 }, is_nullable => 0 },
  'component_index',
  { data_type => 'tinyint', extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_iseq_ext_pr_components_tmp>

=back

=cut

__PACKAGE__->set_primary_key('id_iseq_ext_pr_components_tmp');

=head1 UNIQUE CONSTRAINTS

=head2 C<iseq_ext_pr_comp_unique>

=over 4

=item * L</id_iseq_pr_tmp>

=item * L</id_iseq_pr_component_tmp>

=back

=cut

__PACKAGE__->add_unique_constraint(
  'iseq_ext_pr_comp_unique',
  ['id_iseq_pr_tmp', 'id_iseq_pr_component_tmp'],
);

=head1 RELATIONS

=head2 iseq_product

Type: belongs_to

Related object: L<WTSI::DNAP::Warehouse::Schema::Result::IseqExternalProductMetric>

=cut

__PACKAGE__->belongs_to(
  'iseq_product',
  'WTSI::DNAP::Warehouse::Schema::Result::IseqExternalProductMetric',
  { id_iseq_ext_pr_metrics_tmp => 'id_iseq_pr_tmp' },
  { is_deferrable => 1, on_delete => 'CASCADE', on_update => 'NO ACTION' },
);

=head2 iseq_product_component

Type: belongs_to

Related object: L<WTSI::DNAP::Warehouse::Schema::Result::IseqProductMetric>

=cut

__PACKAGE__->belongs_to(
  'iseq_product_component',
  'WTSI::DNAP::Warehouse::Schema::Result::IseqProductMetric',
  { id_iseq_pr_metrics_tmp => 'id_iseq_pr_component_tmp' },
  {
    is_deferrable => 1,
    join_type     => 'LEFT',
    on_delete     => 'SET NULL',
    on_update     => 'NO ACTION',
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-09-10 13:54:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zj/Db+JD6MS1y/fGCLjDcA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
