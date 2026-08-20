import React, { useState } from 'react';
import { PieChart, Pie, Cell, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface SpendingPieChartProps {
  data: { name: string; value: number }[];
}

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#AF19FF', '#FF1942', '#19FFC4', '#FFD119'];

const SpendingPieChart: React.FC<SpendingPieChartProps> = ({ data }) => {
  const [hiddenCategories, setHiddenCategories] = useState<string[]>([]);

  if (!data || data.length === 0) {
    return <div className="text-center p-4">No spending data available for this period.</div>;
  }

  const handleLegendItemClick = (entry: any) => {
    const dataKey = entry.value; // 'value' is the name of the category from the legend payload
    if (hiddenCategories.includes(dataKey)) {
      setHiddenCategories(hiddenCategories.filter((item) => item !== dataKey));
    } else {
      setHiddenCategories([...hiddenCategories, dataKey]);
    }
  };

  const filteredData = data.filter(entry => !hiddenCategories.includes(entry.name));

  return (
    <ResponsiveContainer width="100%" height={300}>
      <PieChart margin={{ top: 20, right: 0, left: 0, bottom: 0 }}>
        <Pie
          data={filteredData}
          cx="50%"
          cy="50%"
          labelLine={false}
          outerRadius={70}
          fill="#8884d8"
          dataKey="value"
          label={({ name, percent }) => `${name} ${(percent ? percent * 100 : 0).toFixed(0)}%`}
          nameKey="name"
        >
          {filteredData.map((_, index) => (
            <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
          ))}
        </Pie>
        <Tooltip formatter={(value: any) => `$${(value || 0).toFixed(2)}`} />
        {/* Custom Legend to handle click events */}
        <Legend onClick={handleLegendItemClick} />
      </PieChart>
    </ResponsiveContainer>
  );
};

export default SpendingPieChart;
