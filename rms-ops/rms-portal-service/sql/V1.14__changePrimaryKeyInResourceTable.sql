alter table values
    drop constraint fk_resources;
alter table headcount_resource
    drop constraint fk_resources;
alter table resources_hardskills
    drop constraint fk_resources_hardskills_resources;
alter table resources_roles
    drop constraint fk_resources ;

-- change primary key(id) to uuid
alter table resources
    drop constraint resources_pkey;

alter table resources
    add constraint unique_resources
        unique (id);

alter table resources
    add constraint resources_pkey
        primary key (uuid);

--add fk key again

alter table headcount_resource
    add constraint fk_resources
        foreign key (resources_id) references resources (id);

alter table resources_roles
    add constraint fk_resources
        foreign key (resources_id) references resources (id);

alter table values
    add constraint fk_resources
        foreign key (resources_id) references resources (id);

alter table resources_hardskills
    add constraint fk_resources
        foreign key (resources_id) references resources (id);
