# flows

Traffic analysis queries on a simulated Internet Exchange Point (IXP) dataset.

This project models how network operators analyze infrastructure usage using SQL.  
The database represents ISPs connected to an exchange, their physical ports, installed capacity, and hourly traffic measurements.

## Dataset Structure

The schema includes three main entities:

### ISP
Represents networks connected to the exchange.
- Name
- Country
- Type (Access or Content)

### Switch Ports
Physical ports used by ISPs to connect to the exchange.
- Port capacity (Gbps)
- Linked ISP

### Hourly Traffic
Traffic measurements collected per port over time.
- Timestamp (hourly granularity)
- Outgoing traffic in Gbps

This structure reflects real-world IXP monitoring systems at a simplified scale.

## Goals

The SQL queries in this repository focus on extracting operational and analytical insights such as:

- Average traffic per ISP  
- Infrastructure distribution by country  
- High-traffic providers  
- Capacity vs utilization comparisons  
- Detection of unused ports  
- Peak traffic analysis  
- Traffic growth between time intervals  

The aim is to demonstrate how SQL can be used to analyze network infrastructure data, not just traditional business datasets.

## Repository Structure
schema.sql          Database schema and sample data
queries/            Collection of analytical SQL queries

Each query is written to solve a specific network analysis problem using aggregations, joins, subqueries, and filtering logic.

## Why this project

Although the dataset is small and simulated, the types of questions explored here are similar to those handled in:

- Internet Exchange Points (IXPs)  
- Network Operations Centers (NOCs)  
- Capacity planning teams  
- Network telemetry and data engineering environments  

This repository focuses on **logic, analysis, and data modeling**, using SQL as the main tool.
