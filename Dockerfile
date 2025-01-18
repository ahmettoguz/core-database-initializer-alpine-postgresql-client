FROM ahmettoguz/postgresql-client

WORKDIR /ahmet

COPY ./init.sql .

CMD /bin/sh -c "\
    echo '🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀 Running the init.sql script.' && \
    /usr/bin/psql -U \"$USERNAME\" -d \"$DATABASE\" -h \"$HOST\" -f /ahmet/init.sql && \
    echo '🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀 Execution of init.sql is complete.'"
