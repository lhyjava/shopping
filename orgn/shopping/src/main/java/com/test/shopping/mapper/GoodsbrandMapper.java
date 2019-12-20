package com.test.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import com.test.shopping.entity.Goodsbrand;
import com.test.shopping.entity.Goodstype;

/**
 * 
 * @ClassName: GoodsbrandMapper
 * @Description: 品牌管理
 * @Author lhy
 * @DateTime 2019年11月11日 下午3:19:21
 */
public interface GoodsbrandMapper {
    @Delete({
        "delete from goodsbrand",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into goodsbrand (id, sort, ",
        "firstchar, name, ",
        "type, img, recommand)",
        "values (#{id,jdbcType=INTEGER}, #{sort,jdbcType=INTEGER}, ",
        "#{firstchar,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, ",
        "#{type,jdbcType=VARCHAR}, #{img,jdbcType=VARCHAR}, #{recommand,jdbcType=BIT})"
    })
    int insert(Goodsbrand record);

    @InsertProvider(type=GoodsbrandSqlProvider.class, method="insertSelective")
    int insertSelective(Goodsbrand record);

    @Select({
        "select",
        "id, sort, firstchar, name, type, img, recommand",
        "from goodsbrand",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="firstchar", property="firstchar", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="type", property="type", jdbcType=JdbcType.VARCHAR),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="recommand", property="recommand", jdbcType=JdbcType.BIT)
    })
    Goodsbrand selectByPrimaryKey(Integer id);
    
    //add by lhy begin 11.11
    
    
    @Select({
        "select",
        "id, sort, firstchar, name, type, img, recommand",
        "from goodsbrand order by sort"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="firstchar", property="firstchar", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="type", property="type", jdbcType=JdbcType.VARCHAR),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="recommand", property="recommand", jdbcType=JdbcType.BIT)
    })
    List<Goodsbrand> findall();
    
    
    //add by lhy end 11.11
    
    //add by lhy begin 11.13
    
    @SelectProvider(type=GoodsbrandSqlProvider.class, method="selectByNameAndType")
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER),
        @Result(column="firstchar", property="firstchar", jdbcType=JdbcType.VARCHAR),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="type", property="type", jdbcType=JdbcType.VARCHAR),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="recommand", property="recommand", jdbcType=JdbcType.BIT)
    })
    List<Goodsbrand> selectByNameAndType(Goodsbrand gb);
    
    @DeleteProvider(type=GoodsbrandSqlProvider.class, method="deleteAll")
    int deleteAll(String ids);
    
    //add by lhy end 11.13
    
    //add by lys 11.18
    @Select({
        "select",
        "id, name, sort",
        "from goodstype"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    List<Goodstype> findall1();
    
    @Select({
        "SELECT DISTINCT(type) FROM goodsbrand"
    })
    List<String> selectAllType();

    @Select({
        "select",
        "id, name, sort",
        "from goodstype",
        "where name = #{name,jdbcType=VARCHAR}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="sort", property="sort", jdbcType=JdbcType.INTEGER)
    })
    Goodstype selectByName(String name);
    
    
    //add by lys end 11.18

    @UpdateProvider(type=GoodsbrandSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Goodsbrand record);

    @Update({
        "update goodsbrand",
        "set sort = #{sort,jdbcType=INTEGER},",
          "firstchar = #{firstchar,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "type = #{type,jdbcType=VARCHAR},",
          "img = #{img,jdbcType=VARCHAR},",
          "recommand = #{recommand,jdbcType=BIT}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Goodsbrand record);
    
    //add by lhy 1129 begin
    
    @Select({
        "SELECT distinct b.id, b.sort, b.firstchar, b.name, b.type, b.img, b.recommand from typebrand t, goodsbrand b",
        "where t.brandid = b.id AND t.typeid = #{typeid,jdbcType=INTEGER}"
    })
    List<Goodsbrand> selectByTypeid(Integer typeid);
    
    //add by lhy 1129 end
}