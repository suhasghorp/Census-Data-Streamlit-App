# Census-Streamlit-app
Docker container for a Streamlit app that performs a brief analysis of Census data. 
[Medium Article detailing deployment to Azure.](https://towardsdatascience.com/deploying-a-streamlit-web-app-with-azure-app-service-1f09a2159743?source=friends_link&sk=fa59624f14261f6693bc250f396d0983)

az login

az group create -l eastus -n CensusApp

az acr create --name SuhasCensusAppRegistry --resource-group CensusApp --sku basic --admin-enabled true

az acr build --registry SuhasCensusAppRegistry --resource-group CensusApp --image census-app .

az appservice plan create -g CensusApp -n CensusAppServicePlan -l eastus --is-linux --sku B1

az webapp create -g CensusApp -p CensusAppServicePlan -n suhas-census-web-app -i suhascensusappregistry.azurecr.io/census-app:latest
