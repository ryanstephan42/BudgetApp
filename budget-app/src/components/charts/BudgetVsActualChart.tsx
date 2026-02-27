import React, { useState } from 'react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer, LabelList, Cell } from 'recharts';

interface BudgetVsActualChartProps {
  data: { category: string; allocated: number; spent: number; difference: number }[];
}

const CustomLabel = (props: any) => {
  const { x, y, value, payload } = props;
  
  if (!payload || payload.spent === undefined || payload.allocated === undefined) return null;

  const { spent, allocated } = payload;
  const isOverspent = spent > allocated;
  const labelText = `$${spent.toFixed(2)} (${isOverspent ? '+' : ''}${value.toFixed(2)})`;
  
  // Position the label slightly outside the bar,
  // adjusting for positive (right) or negative (left) bars
  const labelX = x + (isOverspent ? 5 : -5); // Shift right for positive, left for negative
  const textAnchor = isOverspent ? 'start' : 'end'; // Align text start for positive, end for negative

  return (
    <text x={labelX} y={y} dy={-4} fill={isOverspent ? '#FF0000' : '#00C49F'} textAnchor={textAnchor} fontSize={12}>
      {labelText}
    </text>
  );
};

const BudgetVsActualChart: React.FC<BudgetVsActualChartProps> = ({ data }) => {
  const [hiddenCategories, setHiddenCategories] = useState<string[]>([]);

  if (!data || data.length === 0) {
    return <div className="text-center p-4">No budget vs. actual data available.</div>;
  }

  const handleCategoryClick = (dataKey: string) => {
    if (hiddenCategories.includes(dataKey)) {
      setHiddenCategories(hiddenCategories.filter((item) => item !== dataKey));
    } else {
      setHiddenCategories([...hiddenCategories, dataKey]);
    }
  };

  // Filter out categories where allocated is 0 and spent is 0, unless explicitly needed
  const initialFilteredData = data.filter(entry => entry.allocated > 0 || entry.spent > 0 || entry.difference !== 0);

  // Further filter based on hiddenCategories state
  const finalFilteredData = initialFilteredData.filter(entry => !hiddenCategories.includes(entry.category));

  // Determine the domain for the XAxis to properly center 0
  const maxAbsDifference = Math.max(...finalFilteredData.map(entry => Math.abs(entry.difference)));
  // Ensure domain includes 0 and provides enough padding for labels
  const effectiveMax = Math.max(maxAbsDifference, Math.abs(Math.min(...finalFilteredData.map(entry => entry.difference))));
  const domain = [-effectiveMax * 1.1, effectiveMax * 1.1];

  const CustomYAxisTick = (props: any) => {
    const { x, y, payload } = props;
    const categoryName = payload.value;
    const isHidden = hiddenCategories.includes(categoryName);

    return (
      <g transform={`translate(${x},${y})`}>
        <text
          x={0}
          y={0}
          dy={4}
          textAnchor="end"
          fill="#666"
          onClick={() => handleCategoryClick(categoryName)}
          style={{ cursor: 'pointer', textDecoration: isHidden ? 'line-through' : 'none' }}
        >
          {categoryName}
        </text>
      </g>
    );
  };

  return (
    <ResponsiveContainer width="100%" height={Math.max(300, finalFilteredData.length * 40)}> {/* Adjust height dynamically */}
      <BarChart data={finalFilteredData} layout="vertical" margin={{ top: 20, right: 30, left: 30, bottom: 5 }}>
        <XAxis type="number" domain={domain} />
        <YAxis type="category" dataKey="category" width={100} tick={<CustomYAxisTick />} />
        <Tooltip formatter={(value: number, _: string, props: any) => {
            const { payload } = props;
            if (!payload) return [`Difference: $${value.toFixed(2)}`]; // Defensive check
            return [`Difference: $${value.toFixed(2)}`, `Spent: $${payload.spent.toFixed(2)}`, `Allocated: $${payload.allocated.toFixed(2)}`];
        }} />
        {/* Removed onClick from Legend as filtering is now handled by YAxis ticks */}
        <Legend /> 
        <Bar dataKey="difference" fill="green" name="Spent vs. Allocated">
          {finalFilteredData.map((entry, index) => (
            <Cell key={`cell-${index}`} fill={entry.difference > 0 ? '#FF0000' : '#00C49F'} />
          ))}
          <LabelList
            dataKey="difference"
            position="insideRight" // Adjust position based on bar direction
            content={(props) => <CustomLabel {...props} />}
          />
        </Bar>
      </BarChart>
    </ResponsiveContainer>
  );
};

export default BudgetVsActualChart;
