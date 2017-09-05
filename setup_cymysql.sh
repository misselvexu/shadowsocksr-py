#!/bin/bash
rm -rf CyMySQL
rm -rf cymysql
git clone https://github.com/nakagami/CyMySQL.git "CyMySQL-repo"
mv CyMySQL-repo/cymysql ./cymysql
rm -rf CyMySQL-repo
