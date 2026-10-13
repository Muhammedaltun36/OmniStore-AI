using System;

namespace OmniStore.Engine
{
    public class OrderRoutingEngine
    {
        public string CalculateOptimalFulfillmentNode(int productId, int requestedQuantity, int customerStoreId)
        {
            bool localStoreHasStock = CheckLocalStockAvailability(customerStoreId, productId, requestedQuantity);

            if (localStoreHasStock)
            {
                return $"Fulfilled from Local Store ID: {customerStoreId} (Fastest Delivery)";
            }
            else
            {
                int centralWarehouseId = 101; 
                return $"Fulfilled from Central Warehouse ID: {centralWarehouseId} (Consolidated Shipping)";
            }
        }

        private bool CheckLocalStockAvailability(int storeId, int productId, int qty)
        {
            return true; 
        }
    }
}
