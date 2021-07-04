import re


class UnitExtraction:
    units = (
        'mg',
        'g',
        'kg',
        'ml',
        'l',
        'ea',
        'pack',
        'kit',
        'piece',
        'tablets',
        'wipes',
        'capsules'
    )

    regexs = []
    remove_regex = []

    def __init__(self):
        for unit in self.units:
            self.regexs.append(re.compile('.+\s(\d+|\d+\.\d+)\s({})$'.format(unit), re.IGNORECASE))
            self.regexs.append(re.compile('.+\s(\d+|\d+\.\d+)({})$'.format(unit), re.IGNORECASE))
            self.remove_regex.append(re.compile('(.+)\s(\d+|\d+\.\d+)\s({})$'.format(unit), re.IGNORECASE))
            self.remove_regex.append(re.compile('(.+)\s(\d+|\d+\.\d+)({})$'.format(unit), re.IGNORECASE))

    def parse(self, name):
        for regex in self.regexs:
            matched = regex.match(name)
            if matched:
                return '{} {}'.format(matched.group(1), matched.group(2))
        return None

    def remove_unit(self, name):
        for regex in self.remove_regex:
            matched = regex.match(name)
            if matched:
                full_name = matched.group(1)
                full_name = full_name.rstrip(' -')
                return full_name
        return None