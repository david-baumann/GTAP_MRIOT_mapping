import pickle


class HyperParas:
    def __init__(self):
#        with open('raw_gtap_dataset/regions_list.pkl', 'rb') as f:
#            self.regions_list = pickle.load(f)
#        with open('raw_gtap_dataset/activities_list.pkl', 'rb') as f:
#            self.activities_list = pickle.load(f)
        self.regions_list = [x for x in open('raw_gtap_dataset/REG.csv').read().replace('\n', ',').replace('"', '').lower().split(',') if x]
        self.activities_list = [x for x in open('raw_gtap_dataset/ACTS.csv').read().replace('\n', ',').replace('"', '').lower().split(',') if x]
        with open('raw_gtap_dataset/regions_list_auto.pkl', 'wb') as f:
            pickle.dump(self.regions_list, f)
        with open('raw_gtap_dataset/activities_list_auto.pkl', 'wb') as f:
            pickle.dump(self.activities_list, f)
        self.num_regions = len(self.regions_list)
        self.num_commodities = len(self.activities_list)
        self.num_items = self.num_regions * self.num_commodities
