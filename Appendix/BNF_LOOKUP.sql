
select 
    distinct
    section_descr,
    bnf_chemical_substance
from
    dim.cdr_dy_drug_bnf_dim
where
    bnf_chemical_substance is not null
order by
    2;