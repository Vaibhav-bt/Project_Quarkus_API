package com.vaibhav.repository;

import com.vaibhav.entity.Person;
import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class PersonRepository implements PanacheRepository<Person> {
    // Custom queries (if needed) can be added here
}

