<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="Budget">
   <insert id="insertBudget">
      insert into B_budget (bucket_id, budget_name, budget, expenditure) values (1, #{budget_name}, #{budget}, 0)
   </insert>
   
   <update id="updateBudget">
      update B_budget set budget_name=#{budget_name}, budget=#{budget}, expenditure=#{expenditure} where budget_id=#{budget_id}
   </update>
   
   <delete id="deleteBudget">
      delete from B_budget where budget_id=#{budget_id}
   </delete>
   
   <select id="getBudget" resultType="budget">
      select budget from B_budget where bucket_id=#{bucket_id} order by budget_id
   </select>
   
   <select id="getBudgetList" resultType="budget">
      select * from B_budget where bucket_id=#{bucket_id} order by budget_id
   </select>
   
   
</mapper>