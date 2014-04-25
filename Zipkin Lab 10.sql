--Joshua Zipkin
--Lab 10

--PreReqsFor
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   inputNum  int       := $1;
   resultset REFCURSOR := $2;
begin
   open resultset for 
      select num, name, credits
      from courses
      where num in (select preReqNum
                    from prerequisites
                    where courseNum = inputNum);
   return resultset;
end;
$$ 
language plpgsql;

--isPreReqFor
create or replace function isPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   inputNum  int       := $1;
   resultset REFCURSOR := $2;
begin
   open resultset for 
      select num, name, credits
      from courses
      where num in (select courseNum
                    from prerequisites
                    where preReqNum = inputNum);
   return resultset;
end;
$$ 
language plpgsql;