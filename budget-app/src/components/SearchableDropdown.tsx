import React from 'react';
import Select from 'react-select';

interface Option {
  value: string;
  label: string;
}

interface SearchableDropdownProps {
  options: Option[];
  value: Option | null | undefined;
  onChange: (selectedOption: Option | null) => void;
}

const SearchableDropdown: React.FC<SearchableDropdownProps> = React.memo(({
  options,
  value,
  onChange,
}) => {
  return (
    <Select
      options={options}
      value={value}
      onChange={onChange}
      isSearchable
      styles={{
        control: (provided) => ({
          ...provided,
          backgroundColor: '#333',
          borderColor: '#555',
        }),
        singleValue: (provided) => ({
          ...provided,
          color: 'white',
        }),
        menu: (provided) => ({
          ...provided,
          backgroundColor: '#333',
        }),
        option: (provided, state) => ({
          ...provided,
          backgroundColor: state.isFocused ? '#555' : '#333',
          color: 'white',
        }),
      }}
    />
  );
});

export default SearchableDropdown;
