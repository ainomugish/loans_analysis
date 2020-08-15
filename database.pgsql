--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: borrowerdim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.borrowerdim (
    borrowerid integer NOT NULL,
    borrower character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.borrowerdim OWNER TO dw;

--
-- Name: countrydim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.countrydim (
    countryid integer NOT NULL,
    countrycode character varying,
    country character varying,
    year character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.countrydim OWNER TO dw;

--
-- Name: eopdim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.eopdim (
    eopid integer NOT NULL,
    day character varying,
    month character varying,
    year character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.eopdim OWNER TO dw;

--
-- Name: guarantordim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.guarantordim (
    guarantorid integer NOT NULL,
    guarantorcode character varying,
    guarantor character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.guarantordim OWNER TO dw;

--
-- Name: interestratedim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.interestratedim (
    interestrateid integer NOT NULL,
    interestrate character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.interestratedim OWNER TO dw;

--
-- Name: loandim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.loandim (
    loanid integer NOT NULL,
    loannumber character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loandim OWNER TO dw;

--
-- Name: loanfact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loanfact (
    loanid integer,
    eopid integer,
    countryid integer,
    regionid integer,
    projectid integer,
    borrowerid integer,
    guarantorid integer,
    loantypeid integer,
    loanstatusid integer,
    interestrateid integer,
    orig_principal_amt double precision,
    cancelled_amt double precision,
    undisbursed_amt double precision,
    disbursed_amt double precision,
    repaid_to_ibrd double precision,
    due_to_ibrd double precision,
    exchg_adjustment double precision,
    borrower_oblig double precision,
    sold_3rd_party double precision,
    repaid_3rd_party double precision,
    due_3rd_party double precision,
    loans_held double precision,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loanfact OWNER TO postgres;

--
-- Name: loanstatusdim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.loanstatusdim (
    loanstatusid integer NOT NULL,
    loanstatus character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loanstatusdim OWNER TO dw;

--
-- Name: loantypedim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.loantypedim (
    loantypeid integer NOT NULL,
    loantype character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loantypedim OWNER TO dw;

--
-- Name: projectdim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.projectdim (
    projectid integer NOT NULL,
    projectidsrc character varying,
    projectname character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.projectdim OWNER TO dw;

--
-- Name: regiondim; Type: TABLE; Schema: public; Owner: dw
--

CREATE TABLE public.regiondim (
    regionid integer NOT NULL,
    region character varying,
    insert_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.regiondim OWNER TO dw;

--
-- Name: borrowerdim borrowerDim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.borrowerdim
    ADD CONSTRAINT "borrowerDim_pkey" PRIMARY KEY (borrowerid);


--
-- Name: countrydim countrydim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.countrydim
    ADD CONSTRAINT countrydim_pkey PRIMARY KEY (countryid);


--
-- Name: eopdim eopdim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.eopdim
    ADD CONSTRAINT eopdim_pkey PRIMARY KEY (eopid);


--
-- Name: guarantordim guarantordim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.guarantordim
    ADD CONSTRAINT guarantordim_pkey PRIMARY KEY (guarantorid);


--
-- Name: interestratedim interestrateDim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.interestratedim
    ADD CONSTRAINT "interestrateDim_pkey" PRIMARY KEY (interestrateid);


--
-- Name: loandim loanDim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.loandim
    ADD CONSTRAINT "loanDim_pkey" PRIMARY KEY (loanid);


--
-- Name: loanstatusdim loanstatusDim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.loanstatusdim
    ADD CONSTRAINT "loanstatusDim_pkey" PRIMARY KEY (loanstatusid);


--
-- Name: loantypedim loantypeDim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.loantypedim
    ADD CONSTRAINT "loantypeDim_pkey" PRIMARY KEY (loantypeid);


--
-- Name: projectdim projectdim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.projectdim
    ADD CONSTRAINT projectdim_pkey PRIMARY KEY (projectid);


--
-- Name: regiondim regiondim_pkey; Type: CONSTRAINT; Schema: public; Owner: dw
--

ALTER TABLE ONLY public.regiondim
    ADD CONSTRAINT regiondim_pkey PRIMARY KEY (regionid);


--
-- Name: fki_FK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK" ON public.loanfact USING btree (loanid);


--
-- Name: fki_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk ON public.loanfact USING btree (eopid);


--
-- Name: fki_fkborrower; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkborrower ON public.loanfact USING btree (borrowerid);


--
-- Name: fki_fkctry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkctry ON public.loanfact USING btree (countryid);


--
-- Name: fki_fkguarantor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkguarantor ON public.loanfact USING btree (guarantorid);


--
-- Name: fki_fkinterestrate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkinterestrate ON public.loanfact USING btree (interestrateid);


--
-- Name: fki_fkloanstatus; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkloanstatus ON public.loanfact USING btree (loanstatusid);


--
-- Name: fki_fkloantype; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkloantype ON public.loanfact USING btree (loantypeid);


--
-- Name: fki_fkproject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkproject ON public.loanfact USING btree (projectid);


--
-- Name: fki_fkregion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fkregion ON public.loanfact USING btree (regionid);


--
-- Name: loanfact fkborrower; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkborrower FOREIGN KEY (borrowerid) REFERENCES public.borrowerdim(borrowerid);


--
-- Name: loanfact fkctry; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkctry FOREIGN KEY (countryid) REFERENCES public.countrydim(countryid);


--
-- Name: loanfact fkeop; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkeop FOREIGN KEY (eopid) REFERENCES public.eopdim(eopid);


--
-- Name: loanfact fkguarantor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkguarantor FOREIGN KEY (guarantorid) REFERENCES public.guarantordim(guarantorid);


--
-- Name: loanfact fkinterestrate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkinterestrate FOREIGN KEY (interestrateid) REFERENCES public.interestratedim(interestrateid);


--
-- Name: loanfact fkloan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkloan FOREIGN KEY (loanid) REFERENCES public.loandim(loanid);


--
-- Name: loanfact fkloanstatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkloanstatus FOREIGN KEY (loanstatusid) REFERENCES public.loanstatusdim(loanstatusid);


--
-- Name: loanfact fkloantype; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkloantype FOREIGN KEY (loantypeid) REFERENCES public.loantypedim(loantypeid);


--
-- Name: loanfact fkproject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkproject FOREIGN KEY (projectid) REFERENCES public.projectdim(projectid);


--
-- Name: loanfact fkregion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanfact
    ADD CONSTRAINT fkregion FOREIGN KEY (regionid) REFERENCES public.regiondim(regionid);


--
-- PostgreSQL database dump complete
--

